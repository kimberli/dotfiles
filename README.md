## Kim's Dotfiles

Finally version controlling these.

Set up by cloning this repo then running `setup.sh` (make sure to do this from within this dotfiles directory).

![screenshot](https://raw.githubusercontent.com/kimberli/dotfiles/master/ex.png)

### Setup
1. Clone this repo
2. Install tmux
3. [Install zsh](https://ohmyz.sh/#install)
4. [Install Powerlevel10k (zsh theme)](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
5. [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
6. [Install Vundle for Neovim]
  - `git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim`
  - TODO: switch to better package manager
7. Run `setup.sh` from this repo
8. Enter `vim` and run `:PluginInstall`

### Terminal Configuration

Colors are:

* foreground - `#fffeeb`
* background - `#132132`
* black - `#3c3c3c`
* red - `#fd8489`
* green - `#a9dd9d`
* yellow - `#fedf81`
* blue - `#86acd7`
* magenta - `#e7d5ff`
* cyan - `#a8d2eb`
* white - `#ededed`

The font I use is [Roboto Mono](https://github.com/powerline/fonts/tree/master/RobotoMono).

### Hammerspoon
I've also included my [Hammerspoon](http://www.hammerspoon.org/) `init.lua` script. It's pretty janky and includes:

* window resizing
* jumping to popular apps
* an ugly Slack API polling menubar item

Symlink it similarly to use it.
