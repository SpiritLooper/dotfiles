# Utiliser bat pour afficher les pages de manuel
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Pager par défaut
export PAGER="bat"

# Type de terminal
export TERM="xterm-256color"

# GPG Key sign env
export GPG_TTY=$(tty)
