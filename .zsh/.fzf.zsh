# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zhangfish/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zhangfish/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/zhangfish/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/zhangfish/.fzf/shell/key-bindings.zsh"
