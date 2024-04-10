# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 启用插件
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/powerlevel10k/powerlevel9k.zsh-theme

# 启用彩色提示符
autoload -U colors && colors

# 启用历史记录
export SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.zsh/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# 每次刷新提示符
setopt prompt_subst

# 补全设置
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# 高亮设置
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.zsh/.fzf.zsh


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
 
# 设置nvim为默认编辑器
export EDITOR=nvim
export VISUAL=nvim

bindkey -e

# 导入代理函数
if [ -d "$HOME/utils" ]; then
    for file in "$HOME/utils"/*; do
        if [[ $file == *.sh ]]; then
            source "$file"
        fi
    done
fi

# 别名
alias vi='nvim'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias less='less -R'
alias grep='grep --color=auto'
alias gs='git status'
alias kssh='kitty +kitten ssh'
alias tm='tmux'
