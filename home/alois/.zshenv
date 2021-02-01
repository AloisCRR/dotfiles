# Set $PATH
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_COMPLETION_TRIGGER='~~'
