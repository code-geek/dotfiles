# Turn on spelling correction
setopt correct

# Correction for arguments
# setopt correctall

# Don't save duplicate in history
setopt histignoredups

# Vi mode bindings
bindkey -v


# tmux plugin settings
# This always starts tmux
# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOSTART_ONCE=true
# ZSH_TMUX_AUTOCONNECT=false
# ZSH_TMUX_FIXTERM=true
# ZSH_TMUX_AUTOQUIT=true

# Default editor to use
export EDITOR=nvim

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/django
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
#    zgen oh-my-zsh plugins/tmuxinator
#    zgen oh-my-zsh plugins/tmux

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/arrow
#    zgen oh-my-zsh themes/gentoo
    zgen load rupa/z

    # save all to init script
    zgen save
fi

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/www
source /usr/local/bin/virtualenvwrapper.sh

# ashish
source ~/.bash_aliases

# Configuration for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix for 256 color terminal
gruvbox_file="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
[ -f $gruvbox_file ] && source $gruvbox_file

