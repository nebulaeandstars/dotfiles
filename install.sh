#!/bin/sh
# sets up and configures the packages I like to have on a fresh install

#-----------------------------
#  _           _        _ _
# (_)_ __  ___| |_ __ _| | |
# | | '_ \/ __| __/ _` | | |
# | | | | \__ \ || (_| | | |
# |_|_| |_|___/\__\__,_|_|_|
#
# ----------------------------
# by nebulaeandstars


################################################################################
# FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS ########
################################################################################

# functions for installing only if needed)
install_with_pacman() {
    if ! pacman -Qs "$1" > /dev/null ; then
        echo
        echo "installing $1..."
        sudo pacman -S "$1" --noconfirm
        echo
    else
        echo "$1 is already installed!"
    fi
}

install_with_yay() {
    if ! pacman -Qs "$1" > /dev/null ; then
        echo
        echo "installing $1..."
        yay -S "$1" --noconfirm
        echo
    else
        echo "$1 is already installed!"
    fi
}

# function for setting up symlinks
link_config() {
    echo "setting up symlinks for $1."
    stow -t ~ "$1"
}

# function for enabling services
enable_service() {
    sudo systemctl enable "$1" && echo "$1 is enabled."
}


################################################################################
# PRELIM # PRELIM # PRELIM # PRELIM # PRELIM # PRELIM # PRELIM # PRELIM ########
################################################################################

# make sure that the archlinux servers are reachable
ping -c 1 -W 2 archlinux.org || { echo && echo "cannot connect to the internet. aborting..." && exit;  }

# make sure that the system is up to date
# and that the program is running in the right place
sudo pacman -Syu
cd ~/.dotfiles || { echo && echo "please clone the repository this script came in into ~/.dotfiles" && exit;  }
echo
echo ----------------------------------------
echo "the system is up to date."
echo


################################################################################
# INSTALL # INSTALL # INSTALL # INSTALL # INSTALL # INSTALL # INSTALL ##########
################################################################################

# --- Services --- #

# install/enable key services
install_with_pacman networkmanager
install_with_pacman bluez
# install_with_pacman dhcpcd
install_with_pacman sxhkd
echo

enable_service NetworkManager.service
enable_service bluetooth.service
# enable_service dhcpcd.service
echo


# install xorg, picom, ALSA, and pulseaudio
install_with_pacman alsa
install_with_pacman alsa-utils
install_with_pacman pulseaudio-alsa
install_with_pacman pulseaudio-bluetooth
install_with_pacman xorg
install_with_yay picom-ibhagwan-git
echo


# install i3 and openbox
install_with_pacman i3-gaps
install_with_pacman openbox
# install_with_pacman xmonad

# other
install_with_yay libxft-bgra-git
install_with_pacman cmake
install_with_pacman ueberzug

install_with_pacman npm
install_with_pacman yarn


# --- CLI stuff --- #

# install git and yay
install_with_pacman git
if ! pacman -Qi yay > /dev/null ; then
    echo
    echo "installing yay..."
    cd /tmp || exit
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd ~/.dotfiles || exit
    echo
else
    echo "yay is already installed"
fi
echo


# install basic CLI apps
install_with_pacman pass
install_with_pacman stow
install_with_pacman neovim
install_with_pacman vimpager
install_with_pacman neomutt
install_with_pacman newsboat
install_with_pacman calcurse
install_with_pacman abook
install_with_pacman vifm
echo

# install other CLI apps
install_with_pacman cowsay
install_with_pacman fortune-mod
install_with_pacman lolcat
install_with_pacman neofetch
install_with_pacman youtube-dl
install_with_pacman youtube-viewer
echo


# install zsh
install_with_pacman zsh
install_with_yay antigen
[ ! -d ~/.local/share/zsh/ ] && mkdir -p ~/.local/share/zsh/
[ ! -d ~/.local/share/zsh/pure/ ] && git clone https://github.com/sindresorhus/pure.git "$HOME/.local/share/zsh/pure/"


# --- Programming Stuff --- #

# install programming languages and compilers
install_with_pacman python
install_with_pacman texlive-most
install_with_pacman biber
install_with_pacman jdk-openjdk
install_with_pacman java-openjfx
install_with_pacman rustup
install_with_pacman gcc

# install language servers
install_with_pacman texlab
install_with_pacman ccls
install_with_pacman python-language-server
install_with_pacman bash-language-server


# --- GUI stuff --- #

# install basic GUI apps
# install_with_pacman dmenu
install_with_pacman feh
install_with_pacman rxvt-unicode
install_with_yay polybar-git
install_with_yay rxvt-unicode-pixbuf
echo


# install some basic fonts
install_with_pacman ttf-dejavu
install_with_pacman ttf-liberation
install_with_pacman noto-fonts-cjk
install_with_pacman noto-fonts-emoji
echo


# install icons
# install_with_yay paper-icon-theme-git


# install other GUI apps
install_with_pacman blueman
install_with_pacman lxappearance
install_with_pacman mpv
install_with_pacman qutebrowser
install_with_pacman zathura-pdf-poppler
echo


################################################################################
# CONFIG # CONFIG # CONFIG # CONFIG # CONFIG # CONFIG # CONFIG # CONFIG ########
################################################################################

# create symlinks to dotfiles using stow
cd ~/.dotfiles || exit
for PACKAGE in $(ls -d $(pwd)/*/) ; do
    link_config $(basename $PACKAGE)
done
echo


# change default shell to zsh
sudo usermod --shell /bin/zsh "$USER" && echo "default shell changed to zsh"


# done!
echo "setup is complete!"
