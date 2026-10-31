<div align="center">

![chezmoi logo](https://raw.githubusercontent.com/twpayne/chezmoi/master/assets/images/logo_blue_256.svg)
### :house: ~/. dotfiles ~/. :house: &nbsp;

#### \> Managed with chezmoi :house:&nbsp; and home-manager for NixOS :snowflake:&nbsp;

</div>

## :book:&nbsp; Overview

This repository contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi).
Please note that this is my own personal dotfiles.

## :warning:&nbsp; Requirements

### On NixOS :snowflake:&nbsp;

Fish :fish: has to be installed. Add the following lines in your `configuration.nix`

```nix
# Shell app
programs.fish.enable = true;
users.defaultUserShell = pkgs.fish;
environment.shellAliases = lib.mkForce {};
```

### On Fedora :tophat:&nbsp;

These packages has to be installed : 
- `fish`
- `git`
- `nix`

## :inbox_tray:&nbsp; Installation

### On NixOS :snowflake:&nbsp;

Create a nix-shell with dependencies packages
```sh
nix-shell -p home-manager babelfish
```

And update your dotfiles
```sh
chezmoi init --apply https://github.com/SpiritLooper/dotfiles.git
```

### On NixOS :snowflake:&nbsp;

Create a nix-shell with dependencies packages
```sh
nix-shell -p git chezmoi home-manager babelfish starship
```

And update your dotfiles
```sh
chezmoi init --apply https://github.com/SpiritLooper/dotfiles.git
```

> `chezmoi apply` command add dependencies packages automatically

### On MacOS :apple:&nbsp;

Some programs has to be installed
1. brew : [see here](https://brew.sh)
2. chezmoi with brew 

```sh
brew install chezmoi
```` 

And update your dotfiles
```sh
chezmoi init --apply https://github.com/SpiritLooper/dotfiles.git
```


## :inbox_tray:&nbsp; Update dotfiles

Just run
```
chezmoi update
```
