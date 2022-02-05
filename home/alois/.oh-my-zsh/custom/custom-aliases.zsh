# Custom aliases overriding created ones by default

# TODO Add some "peco" command utilities

alias ll='exa --long --icons'
alias la='exa --long --all --icons'
alias l='exa --oneline --icons'
alias lla='exa --long --all --header --icons --extended'
alias ls='exa --oneline --icons'
alias cat='bat'
alias paru-install='paru --removemake --cleanafter --bottomup'
alias paru-search="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru --removemake --cleanafter -S"
alias list-packages="paru -Qq | fzf --preview 'paru -Qil {}' --preview-window=right:50%:wrap --layout=reverse --bind 'enter:execute(paru -Qil {} | less)'"
alias paru-remove="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro sudo paru -Rnsu"
alias paru-deep-remove='paru -Rnsssuc --confirm'
alias temp='cd "$(mktemp -d)"'
alias clear-clipboard='pkill greenclip && greenclip clear && greenclip daemon &'
alias nano='micro'
# alias clear='tput reset'