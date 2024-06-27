function fish_user_key_bindings -d "Fish universal keybinding setters"
    bind \b backward-kill-bigword
    bind \e\[3\;5~ kill-word
end
