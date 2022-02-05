# Completion
setopt  AUTO_PARAM_KEYS
setopt  AUTO_PARAM_SLASH
setopt  BRACE_CCL
setopt  GLOB_SUBST
setopt  HIST_NO_STORE

# List all hidden files in fzf-tab zsh plugin and not list ./ or ../
setopt  GLOB_DOTS && zstyle ':completion:*' special-dirs false

# Correction
setopt  HASH_LIST_ALL

# File regex
setopt	extendedglob

# TODO Remove expansion and add word correction