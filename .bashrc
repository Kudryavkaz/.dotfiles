#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# show neofetch when konsole open
# source ~/.config/neofetch/show_neofetch_start

# enable fzf when use C-R
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# set cmd color
if [ -n "$BASH_VERSION" ]; then
    export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[38;5;118m\]\w\[\e[0m\] \$ '
else
    if [ "$UID" -eq 0 ]; then
        export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f %# "
    else
        export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f \$ "
    fi
fi

# title
export PS1="\[\e]0;\u@\h\a\]$PS1"
export RPROMPT="%F{red}%(?..%?)%f"


alias nv=nvim
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias gs='git status'
alias kssh='kitty +kitten ssh'
