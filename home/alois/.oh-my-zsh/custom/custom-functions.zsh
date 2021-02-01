#!/usr/bin/zsh

# Show all files associated with a package
function package-files() {

    if [ $# -eq 0 ]
        then
            >&2 printf "\nNo arguments provided\n\n"
            return 1
    fi

    paru -Qlq "$@" | grep -v '/$' | xargs -r du -h | sort -h
}

# Custom colored man pages
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# Override the default fzf-tab completion functions/completer
# _files() {
#     local files=($(fd --type f --hidden --follow --exclude .git))
#     compadd -a -f files
# }

# _cd() {
#     local dirs=($(fd --type d --hidden --follow --exclude .git))
#     compadd -a -f dirs
# }