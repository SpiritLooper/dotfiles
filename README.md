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

## :inbox_tray:&nbsp; Installation

### On NixOS :snowflake:&nbsp;

Create a nix-shell with dependencies packages
```sh
nix-shell -p git chezmoi home-manager babelfish starship
```

And update your dotfiles
```sh
chezmoi init https://github.com/spiritlooper/dotfiles.git
chezmoi apply
```

> `chezmoi apply` command add dependencies packages automatically

## :inbox_tray:&nbsp; Update dotfiles

Just run
```
chezmoi update
```
