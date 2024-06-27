if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR vim
end

# Disable greetings
set fish_greeting

# Enable starship 
starship init fish | source
