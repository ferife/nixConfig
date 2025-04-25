# Introduction

This is the configuration for NixOS that I daily drive on my personal laptop

I do not intend for anyone else to use this, but I can't/won't stop you

I made this remote repo to have a secure remote place to keep my config and to keep track of the changes

I made it a public repo to show off that ***I use Nix btw*** lol

But seriously, I did it to show off (mostly to prospective employers) that I am willing and able to learn to use all sorts of different tools.

Also to show off that I understand the value in making changes in a declarative manner as opposed to an imperative manner.
The value of declarativity is that it's easier to find out about the details of a configuration. It's also easier to keep track of the changes made to that configuration, since a declarative config can be tracked through a VCS like git.

# Commands

- Rebuild the system after changing the configuration: `nh os switch -aH laptop`
- Upgrade nixpkgs and rebuild `nh os switch -auH laptop`
- Rebuild home-manager after changing the configuration: `nh home switch -b backup -ac fernandorf@laptop`
  - The `-b backup` is required to not have conflicts with the neovim config
- Rebuild to test a program or make a temporary change: `nh os test -aH laptop`
- Clean up my storage: `nh clean all -ak 10`
- Install my existing configuration into a blank installation from the minimal NixOS ISO image:
  - `nix-shell -p git --command "nix run github:ferife/nixConfig --extra-experimental-features nix-command --extra-experimental-features flakes"`

# Notes

[This website](https://nixos-and-flakes.thiscute.world/) serves as an unofficial beginners guide to NixOS, with a big focus on a flake-based NixOS config

[This website](https://home-manager-options.extranix.com/) can be used to search for Home Manager options

Use the command `nh os switch` to rebuild the NixOS configuration
- Add the `-u`/`--upgrade` flag to upgrade the flake before rebuilding
- Add the `-n`/`--dry` flag to simply show the actions that would be taken without taking them
- Add the `-H`/`--hostname` function lets me choose a host to build from
  - The hostname is the name of the configuration as written in `flake.nix`
- Add the `-a`/`--ask` flag to show all the changes, but ask for confirmation before applying them
- Add the `-n`/`--dry` flag to simply show the actions that would be taken without taking them
- Type `test` instead of `switch` to rebuild and activate without switching
- This all also works with home manager configurations. Simply type `home` instead of `os`
  - For `nh home ...`, use the `-c`/`--configuration` flag instead of `-H`/`--hostname`
  - `nh home test` does not work

Use the command `nh clean all` to clean out old generations and do a garbage collection
- Add the `-k <NUM>`/`--keep <NUM>` flag to keep at least `<NUM>` number of generations
- Add the `-K <TIME>`/`--keep-since <TIME>` flag to keep all generations that are at most `<TIME>`
- Add the `-a`/`--ask` flag to show all the changes, but ask for confirmation before applying them
- Add the `-n`/`--dry` flag to simply show the actions that would be taken without taking them

If a list or object gets modified in multiple modules, all those modifications merge and get applied, assuming there's no conflict

Watch Vimjoyer's YT video "Modularize NixOS and Home Manager | Great Practices" to learn about some good practices to make my config more controllable in a modular way
This touches on the idea of custom options, described in further detail in the NixOS wiki pages on [declaration](https://nixos.wiki/wiki/Declaration) and [NixOS modules](https://nixos.wiki/wiki/NixOS_modules)
# Resources to check out

- [NixOS for the Impatient](https://borretti.me/article/nixos-for-the-impatient)

According to [this blog](https://bmcgee.ie/posts/2023/03/til-how-to-generate-nixos-module-docs/), if I want to generate docs for my custom options, I should separate out each module into one defining the options and one defining the config.

This keeps native NixOS options from appearing in my docs, so it will be only my own custom options

Use [this website](https://nlewo.github.io/nixos-manual-sphinx/development/option-types.xml.html#sec-option-types) to look at option types
Use [this website](https://wiki.nixos.org/wiki/NixOS_modules) to get a quick idea of how to write options
[This website](https://github.com/nix-community/awesome-nix?tab=readme-ov-file) has a large list of Nix-related resources
[This website](https://heywoodlh.io/nixos-gnome-settings-and-keyboard-shortcuts) has tips for modifying GNOME settings within Nix
