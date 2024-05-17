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


# set cmd color
if [ -n "$BASH_VERSION" ]; then
    # export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[38;5;118m\]\w\[\e[0m\] \$ '
    export PS1='\[\e[38;5;135m\]sztu202200201079\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[38;5;118m\]\w\[\e[0m\] \$ '
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

# 设置man手册颜色
man() {
    export MANROFFOPT=-c
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# 导入代理函数
if [ -d "$HOME/utils" ]; then
    for file in "$HOME/utils"/*; do
        if [[ $file == *.sh ]]; then
            source "$file"
        fi
    done
fi

alias vi='nvim'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias less='less -R'
alias grep='grep --color=auto'
alias gs='git status'
alias kssh='kitty +kitten ssh'
alias tm='tmux'
