# Remove default ls
functions --erase ls

# LS alias
alias ls='lsd'

# Add tree cmd
function tree --description 'Tree files with LSD'
    ls --tree $argv
end
