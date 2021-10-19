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

export ZSH="$ZDOTDIR"
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
eval $(dircolors "$XDG_CONFIG_HOME/shell/dircolors")

# source aliases
source "$XDG_CONFIG_HOME/shell/aliasrc"


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
ZSH_HIGHLIGHT_STYLES[alias]='fg=5,bold'
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

screensaver() {
    cbonsai -L $(tput lines) --screensaver --time=0.003
}

message_cowsay() {
    fortune | cowsay | lolcat
    date_message
}

message_bonsai() {
    BONSAI_LINES=$(tput lines)
    BONSAI_MESSAGE=$(date_message)
    # (( BONSAI_LINES < 8 )) && BONSAI_BASE=3 \
    #     || { (( BONSAI_LINES < 15 )) && BONSAI_BASE=2 \
    #     || BONSAI_BASE=1 }
    #         cbonsai -p -m="$BONSAI_MESSAGE" -L $BONSAI_LINES -b $BONSAI_BASE -s $(( $RANDOM % 30000 ))

    (( BONSAI_LINES < 8 )) && BONSAI_BASE=3 \
        || { (( BONSAI_LINES < 15 )) && BONSAI_BASE=2 \
        || BONSAI_BASE=1 }
            cbonsai -p -L $BONSAI_LINES -b $BONSAI_BASE -s $(( $RANDOM % 30000 ))
}

message() {
    which cbonsai > /dev/null && message_bonsai \
        || { which cowsay > /dev/null && message_cowsay }
}

message
