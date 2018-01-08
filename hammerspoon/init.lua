--
-- window resizing
--
function baseMove(x, y, w, h)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.w * x + max.x
        f.y = max.h * y + max.y
        f.w = max.w * w
        f.h = max.h * h
        win:setFrame(f, 0)
    end
end

hs.hotkey.bind({'ctrl', 'cmd'}, 'H', baseMove(0, 0, 0.5, 1))
hs.hotkey.bind({'ctrl', 'cmd'}, 'L', baseMove(0.5, 0, 0.5, 1))
hs.hotkey.bind({'ctrl', 'cmd'}, 'J', baseMove(0, 0.5, 1, 0.5))
hs.hotkey.bind({'ctrl', 'cmd'}, 'K', baseMove(0, 0, 1, 0.5))
hs.hotkey.bind({'ctrl', 'cmd'}, 'M', baseMove(0, 0, 1, 1))

--
-- jump to applications
--
hs.hotkey.bind({'ctrl', 'cmd'}, 'S', function () hs.application.launchOrFocus("Slack") end)
hs.hotkey.bind({'ctrl', 'cmd'}, 'G', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind({'ctrl', 'cmd'}, 'T', function () hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind({'ctrl', 'cmd'}, 'E', function () hs.application.launchOrFocus("Wavebox") end)
hs.hotkey.bind({'ctrl', 'cmd'}, 'F', function () hs.application.launchOrFocus("Messenger for Desktop") end)

--
-- slack menubar item
--
slack = hs.menubar.new()
paused = false
interval = 15  -- seconds in between polls
lastRunTime = ""

token = "xoxp-your-token-here"
userId = "your-user-id-here"

channelListUrl = "https://slack.com/api/channels.list?token=" .. token .. "&exclude_archived=true"
channelInfoUrl = "https://slack.com/api/channels.info?token=" .. token

function watchSlack()
    getUnreadMsgs()
end

function updateMenu()
    slack:setMenu({
        { title = paused and "Resume" or "Pause", fn = togglePause },
        { title = msg, disabled = true },
        { title = "Last run at " .. lastRunTime, disabled = true }
    })
end

function togglePause()
    if paused then
        paused = false
        watchSlack()
    else
        paused = true
        updateMenu()
    end
end

function setSlackIcon(active, msg)
    lastRunTime = os.date("%I:%M:%S %p")
    updateMenu()
    if active then
        slack:setIcon(hs.image.imageFromPath("~/.hammerspoon/icons/slack_active.png"), false)
    else
        slack:setIcon(hs.image.imageFromPath("~/.hammerspoon/icons/slack_default.png"), false)
    end
    if not paused then
        hs.timer.doAfter(interval, getUnreadMsgs)
    end
end

-- logger = hs.logger.new("slack", "debug")

-- this is ugly but i don't know better lua
function getUnreadMsgs()
    channel_x = 1
    function poll_next_channel()
        id = channels[channel_x]["id"]
        url = channelInfoUrl .. "&channel=" .. id
        hs.http.asyncGet(url, {["Authorization"] = "Bearer " .. token }, check_channel)
    end
    function check_channel(resp_code, resp_body, _)
        if resp_code ~= 200 then
            setSlackIcon(false, "Failed - " .. resp_code)
            return
        end
        resp = hs.json.decode(resp_body)
        if resp["latest"] ~= nil then
            latest_user = resp["latest"]["user"]
        end
        unreads = resp["channel"]["unread_count_display"]
        if unreads ~= nil and unreads > 0 and latest_user ~= userId then
            setSlackIcon(true, unreads .. " unread message(s)")
            return
        else
            channel_x = channel_x + 1
            if channel_x <= #channels then
                poll_next_channel()
            else
                setSlackIcon(false, "No new messages")
            end
        end
    end
    function poll_channels(resp_code, resp_body, _)
        if resp_code ~= 200 then
            setSlackIcon(false, "Failed - " .. resp_code)
            return
        end
        channels = hs.json.decode(resp_body)["channels"]
        if channels ~= nil then
            poll_next_channel()
        else
            setSlackIcon(false, "Failed - invalid channel list")
        end
    end
    hs.http.asyncGet(channelListUrl, {["Authorization"] = "Bearer " .. token }, poll_channels)
end

-- start watching slack
if slack then
    watchSlack()
end
