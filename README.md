# Introduction

This is the configuration for NixOS that I daily drive on my personal laptop

I do not intend for anyone else to use this, but I can't/won't stop you

I made this remote repo to have a secure remote place to keep my config and to keep track of the changes

I made it a public repo to show off that ***I use Nix btw*** lol

But seriously, I did it to show off (mostly to prospective employers) that I am willing and able to learn to use all sorts of different tools.

Also to show off that I understand the value in making changes in a declarative manner as opposed to an imperative manner.
The value of declarativity is that it's easier to find out about the details of a configuration. It's also easier to keep track of the changes made to that configuration, since a declarative config can be tracked through a VCS like git.

# To-Do List
- [x] Figure out how to use MullvadVPN on NixOS
- [x] Add back all the packages I was using
- [x] Configure GNOME - Use Home Manager for this
- [x] Figure out gaming on NixOS
- [x] Implement Home Manager
- [x] Make this a remote repo
- [x] Make my configuration more modular
- [x] Set up NixOS auto update
- [-] Add gitignore with hardware-configuration.nix
- [x] Create the options necessary for multiple devices to make use of this setup
- [X] Set up auto update for all my applications

- [ ] Add Whatsapp access to the computer for communicating with mom
- [ ] Figure out if there's a way to add my Obsidian plugin & settings setup to my flake, or at least to a git repo
- [ ] Set up a password management solution
- [ ] Cancel my subsctiption to ExpressVPN
- [ ] Look into Manix CLI
- [ ] Separate out the packages into ones that are core components needed by all users of the computer and everything else
    - The core components should be installed by NixOS
    - Everything else should be installed by Home Manager
    - This limits the amount of packages that have privileged access

# Notes

[This website](https://nixos-and-flakes.thiscute.world/) serves as an unofficial beginners guide to NixOS, with a big focus on a flake-based NixOS config

[This website](https://home-manager-options.extranix.com/) can be used to search for Home Manager options

Use the command `sudo nixos-rebuild switch --flake ~/Documents/nixConfig/#laptop` to rebuild the NixOS configuration

To update packages, first `cd` into the location of this config, then run `sudo nix flake update`, and finally rebuild the NixOS configuration.

Use the command `sudo home-manager switch --flake ~/Documents/nixConfig/#fernandorf@laptop` to rebuild the Home Manager configuration

If a list or object gets modified in multiple modules, all those modifications merge and get applied, assuming there's no conflict