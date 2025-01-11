# cat replacement
alias cat='bat --paging=never'

# LS alias
alias ls='lsd'

# Kubernetes
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

# TTY Clock
alias clock 'tty-clock -sxcbD -d 0.99s'

# Git diff
function batdiff --description "Better Git diff with batcat"
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
end

# Add tree cmd
function tree --description 'Tree files with LSD'
    ls --tree $argv
end
