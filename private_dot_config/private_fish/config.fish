if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR vim
end

# Disable greetings
set fish_greeting

# sourcing nix envs
babelfish < $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh | source 

# Enable starship 
starship init fish | source
