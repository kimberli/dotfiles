# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/python/libexec/bin:$HOME/miniconda3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
if [[ -n $SSH_CONNECTION ]]; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir rbenv virtualenv anaconda vcs)
else
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv virtualenv anaconda vcs)
fi
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator history time)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_HIDE_BRANCH_ICON=true
POWERLEVEL9K_VCS_HIDE_TAGS=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SSH_ICON=""

POWERLEVEL9K_DIR_HOME_BACKGROUND='red'
POWERLEVEL9K_DIR_HOME_FOREGROUND='089'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='red'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='089'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='red'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='089'
POWERLEVEL9K_HOST_REMOTE_BACKGROUND='blue'
POWERLEVEL9K_HOST_REMOTE_FOREGROUND='018'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='140'
POWERLEVEL9K_ANACONDA_BACKGROUND='140'
POWERLEVEL9K_RBENV_BACKGROUND='140'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Custom
unsetopt share_history
bindkey -v
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias l="ls -lh"
alias ll="ls -alG"
alias ..='cd ../'
alias ...='cd ../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

alias chrm='open -a "Google Chrome"'
alias subl='open -a "Sublime Text"'
alias atom='open -a "Atom"'
alias mktex='cp ~/template.tex'
alias pynb='jupyter notebook'
alias server='python -m SimpleHTTPServer'

alias goc='cd ~/Google\ Drive/College/17f/'
alias go031='cd ~/Documents/031/17f/'

alias ga='git add'
alias gu='git pull'
alias gd='git diff'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gb='git branch'
alias gk='git checkout'
alias gm='git merge'
alias gl='git log'
alias gh='git stash'
alias gr='git rebase'
alias gri='git rebase -i'
alias gcp='git cherry-pick'
alias gpom='git push origin master'
alias gphm='git push heroku master'
