## nebulaeandstars' dotfiles

### Disclaimer

These dotfiles have all been tested on Arch linux. I can't guarantee that things won't break on other distros, although I'm pretty sure everything will be pretty much the same.

Here are the caveats:

- `zsh` installation aliases will not work on any system not running `pacman`.
- `install.sh` uses both `pacman` and `yay`, and is therefore exclusive to Arch or Arch-based distros.
- some dotfiles require the installation of external packages (included in the install script).
    - `libxft-bgra`: fixes a bug that will cause emojis to crash dwm and dmenu.
    - `ueberzug`: for image previews in the terminal (can be replaced with w3m).
    - `npm`, `python`, `python-pip`, `cmake`, and `yarn`: required for some of the vim plugins to work.
    - `vimpager`: for using vim as a terminal pager (for viewing man pages, etc).
    - `cowsay`, `fortune`, and `lolcat`: for the `zsh` greeting message (can be disabled manually).
    - `ttf-dejavu` and `noto-fonts-emoji`: sometimes manually specified.
    - (obviously if you want to configure a program you will need to install it first).

### Installation

**tl;dr:** `cd this_repo ; stow -t ~ *`

Each subdirectory within this repo mimics your `$HOME` folder. For example: the `nvim` directory contains `.config/nvim/`. I've set it up this way so that you can pick and choose which programs you would like me to configure. You can move files across individually as you need them, or take the much easier option of using `stow`, a GNU utility that should be available on every linux distribution.

If this repository is in your `$HOME` folder, running `stow nvim` will create symbolic links wherever they need to go. DO NOT DELETE THIS DIRECTORY, AS YOU WILL BREAK THE LINKS. If you would rather store this repository somewhere else, you will need to specify a target with the `-t` option when running `stow`. `stow -t *` will install all everything in this repository.

### Support

If you need help setting things up or if you find a bug, please feel free to email me at nebulaeandstars@gmail.com.
