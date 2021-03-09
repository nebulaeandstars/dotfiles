# --------------------------
#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
# --------------------------
# by nebulaeandstars


################################################################################
# GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL ##########
################################################################################

export ZSH="$HOME/.config/zsh"
ZSH_THEME=""

# make _ and - interchangeable
HYPHEN_INSENSITIVE="true"

# for command history
HIST_STAMPS="dd.mm.yyyy"

# enable command history
export HISTFILE="$HOME/.local/share/zsh/history"
export HISTSIZE=10000
export HISTFILESIZE=10000
export SAVEHIST=10000

# history settings
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# use the completion configuration from oh-my-zsh
source "$ZDOTDIR/completion.zsh"

# use custom colors for ls
eval $(dircolors "$ZDOTDIR/dircolors")


################################################################################
# ALIASES # ALIASES # ALIASES # ALIASES # ALIASES # ALIASES # ALIASES ##########
################################################################################

# shell
alias c="clear"
alias ccat="highlight --out-format=ansi"
alias clear="message"
alias grep="grep --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias ln="ln -v"
alias ls="ls -hN --color=auto --group-directories-first"
alias mkd="mkdir"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias rm="rm -v"
alias sx="startx"
alias stow="stow -v"

# general
alias SS="sudo systemctl"
alias YT="youtube-viewer"
alias f="vifm"
alias sf="sudo vifm"
alias sv="sudo nvim"
alias t="setsid $TERMINAL >/dev/null & ; sleep 0.5 ; clear"
alias v="nvim"
alias o="nvim"
alias e="nvim"
alias ed="nvim"
alias vim="nvim"
alias m="neomutt"
alias mutt="neomutt"
alias n="newsboat"
alias yt="youtube-dl -ic"
alias yta="youtube-dl -xic"
alias vifm="vifmrun"

alias smk="sudo cp config.def.h config.h && sudo make clean install"

alias bw-sync="echo generating session key... &&
    export BW_SESSION=\$(bw unlock --raw \"\$(pass bitwarden)\") \
    && echo syncing... && bw sync"

alias battery="cat /sys/class/power_supply/BAT0/capacity"

alias anaconda="source /opt/anaconda/bin/activate root"

# config
alias i3c="nvim ~/.config/i3/config"
alias vrc="nvim ~/.config/nvim/init.vim"
alias zrc="nvim ~/.config/zsh/.zshrc"
alias vx="nvim ~/.xinitrc"

# git
alias ga="git add"
alias gr="git restore --staged"
alias gc="git commit -m"
alias gf="git fetch"
alias gm="git merge"
alias gp="git push"
alias gs="git status"
alias gv="git status -v"

# pacman
alias R="sudo pacman -Rns"
alias Rorphs="pacman -Qtdq | sudo pacman -Rns -"
alias S="sudo pacman -S"
alias syu="sudo pacman -Syu"
alias p="sudo pacman"


################################################################################
# PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS ##########
################################################################################

source /usr/share/zsh/share/antigen.zsh

antigen bundle woefe/vi-mode.zsh
antigen bundle hcgraf/zsh-sudo

antigen bundle djui/alias-tips

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply


################################################################################
# PROMPT # PROMPT # PROMPT # PROMPT # PROMPT # PROMPT # PROMPT # PROMPT ########
################################################################################

# set up and configure the "pure" prompt (installed separately)
fpath+=("$HOME/.local/share/zsh/pure")
autoload -U promptinit; promptinit

zstyle :prompt:pure:execution_time color 10
zstyle :prompt:pure:git:arrow color 14
zstyle :prompt:pure:git:branch color 15
zstyle :prompt:pure:git:branch:cached color 9
zstyle :prompt:pure:git:action color 10
zstyle :prompt:pure:git:dirty color 13
zstyle :prompt:pure:host color 12
zstyle :prompt:pure:path color 14
zstyle :prompt:pure:prompt:error color 9
zstyle :prompt:pure:prompt:success color 15
zstyle :prompt:pure:prompt:continuation color 13
zstyle :prompt:pure:user color 12
zstyle :prompt:pure:user:root 11
zstyle :prompt:pure:virtualenv color 10
prompt pure


################################################################################
# HIGHLIGHTING # HIGHLIGHTING # HIGHLIGHTING # HIGHLIGHTING # HIGHLIGHTING #####
################################################################################

# Syntax highlighting (requires zsh-syntax-highlighting)
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=9,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=11,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=14,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=14,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=14,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=13,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=13,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=13,bold'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=11,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=12,bold'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=12,bold'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=11,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=12,bold'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[assign]='fg=12,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10,bold'


################################################################################
# MESSAGE # MESSAGE # MESSAGE # MESSAGE # MESSAGE # MESSAGE # MESSAGE ##########
################################################################################

date_message() {
    date +"%A %d/%B/%Y"
    date +"%I:%M %p"
}

message_cowsay() {
    fortune | cowsay | lolcat
    date_message
}

message_bonsai() {
    cbonsai --print --message="$(date_message)" -L $(tput lines) --time 0.001 --live
}

message() {
    message_bonsai
}

message
