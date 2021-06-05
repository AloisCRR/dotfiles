# Custom colored man pages
man() {
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

# The "command not found" handler
command_not_found_handler() {
	local pkgs cmd="$1" files=()
	printf 'zsh: command not found: %s' "$cmd" # print command not found asap, then search for packages
	files=(${(f)"$(paru -F --machinereadable -- "/usr/bin/${cmd}")"})
	if (( ${#files[@]} )); then
		printf '\r%s may be found in the following packages:\n' "$cmd"
		local res=() repo package version file
		for file in "$files[@]"; do
			res=("${(0)file}")
			repo="$res[1]"
			package="$res[2]"
			version="$res[3]"
			file="$res[4]"
			printf '  %s/%s %s: /%s\n' "$repo" "$package" "$version" "$file"
		done
	else
		printf '\n'
	fi
	return 127
}

vscode() {
	code $@ && exit
}

lt() {
	if [ $# -eq 0 ]
		then
			exa --tree --level 2 $@
		else
			exa --tree --level $@
	fi
}

lta() {
	if [ $# -eq 0 ]
		then
			exa --tree --all --level 2
		else
			exa --tree --all --level $1
	fi
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