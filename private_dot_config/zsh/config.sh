eval "$(brew shellenv)"

# Args autoparcours
zmodload zsh/complist
setopt menucomplete
zstyle ':completion:*' menu select=0 search

if type brew &> /dev/null; then
  FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit

# Variables d'environnement pour les sessions interactives
if [[ -o interactive ]]; then
    export EDITOR=vim
fi

# Starship
eval "$(starship init zsh)"

# chezmoi
eval "$(chezmoi completion zsh)"

# Ajout au PATH
export PATH="$HOME/.local/bin:$PATH"

for conf_file in ~/.config/zsh/conf.d/*; do
    source "$conf_file"
done
