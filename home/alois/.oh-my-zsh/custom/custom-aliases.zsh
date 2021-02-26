# Custom aliases overriding created ones by default

alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'
alias paru-clean-install='paru --removemake --cleanafter --confirm --bottomup'
alias paru-list-packages="paru -Qq | fzf --preview 'paru -Qil {}' --preview-window=right:50%:wrap --layout=reverse --bind 'enter:execute(paru -Qil {} | less)'"
alias paru-remove='paru -Rnsu'
alias paru-remove-all='paru -Rnsssuc --confirm'
alias paru-info='paru -Sii'
alias temp='cd "$(mktemp -d)"'
# alias npm='pnpm'
# alias npx='pnpx'
alias clear-clipboard='pkill greenclip && greenclip clear && greenclip daemon &'