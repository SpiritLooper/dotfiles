# cat replacement
alias cat='bat --decorations=never --paging=never'

# LS replacement
alias ls='lsd'

# Kubernetes
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

# Kitty
alias icat='kitten icat'
alias diff='kitten diff'

# ip colors
alias ip='ip -c'

# TTY Clock
alias clock='tty-clock -sxcbD -d 0.99s'

# Git diff avec bat
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# Tree avec lsd
tree() {
    ls --tree "$@"
}
