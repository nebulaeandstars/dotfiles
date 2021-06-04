## nebulaeandstars' dotfiles

This repository contains core configuration files for a basic linux setup.  It
doesn't come with a window manager configuration, as the base files assume that
you are using dwm or your own custom setup. Config files for unused programs,
window manager and game configs can be found in my
[dotfiles-extra](https://github.com/nebulaeandstars/dotfiles-extra) repository.

I also have a handy bootstrapping script,
[larch](https://github.com/nebulaeandstars/larch). If you just want a fresh
install using my dotfiles, use that. It will automagically install everything
you need and configure it all to boot.

### Disclaimer

These dotfiles have only been tested on Arch linux. While I can't imagine that
this would be a problem for most dotfiles, I can't guarantee that things won't
break on other distributions.

Here are the caveats:

- `zsh` installation aliases will not work on any system not using `pacman`.
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

Each subdirectory within this repo mimics your `$HOME` folder. For example: the
`nvim` directory contains `.config/nvim/`. I've set it up this way so that you
can pick and choose which programs you would like me to configure. You can move
files across individually as you need them, or take the much easier option of
using `stow`, a GNU utility that should be available in most package managers.

If this repository is in your `$HOME` folder, running `stow nvim` (for instance)
will create symbolic links wherever they need to go. DO NOT DELETE THIS
DIRECTORY AFTERWARD, AS YOU WILL BREAK THE LINKS. If you would rather store this
repository somewhere other than in your $HOME directory, you will need to
specify a target with the `-t` option when running `stow`. `stow -t *` will
install all everything in this repository.

### Support

If you need help setting things up or if you find a bug, please feel free to
email me at nebulaeandstars@gmail.com.
