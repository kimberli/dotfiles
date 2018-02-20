## Kim's Dotfiles

Finally version controlling these.

Set up by cloning this repo then running `setup.sh` (make sure to do this from within this dotfiles directory).

![screenshot](https://raw.githubusercontent.com/kimberli/dotfiles/master/ex.png)

### Hammerspoon
I've also included my [Hammerspoon](http://www.hammerspoon.org/) `init.lua` script. It's pretty janky and includes:

* window resizing
* jumping to popular apps
* an ugly Slack API polling menubar item

Symlink it similarly to use it.

### Local
The `local` branch on this remote intentionally has a divergent history to make it harder to accidentally push local changes to this remote. Take advantage of this by making a new local branch named `local` to commit any additional changes you want to keep private to your local machine.
