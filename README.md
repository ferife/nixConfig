# Introduction

This is the configuration for NixOS that I daily drive on my personal laptop

I do not intend for anyone else to use this, but I can't/won't stop you

I made this remote repo to have a secure remote place to keep my config and to keep track of the changes

I made this remote repo public to show off that ***I use Nix btw*** lol

But seriously, I did it to show off (mostly to prospective employers) that I am willing and able to learn to use all sorts of different tools.
Also to show off that I understand the value in making changes in a declarative manner as opposed to an imperative manner.

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


- [ ] Add Whatsapp access to the computer for communicating with mom
- [ ] Figure out if there's a way to add my Obsidian plugin & settings setup to my flake, or at least to a git repo
- [ ] Set up a password management solution
- [ ] Cancel my subsctiption to ExpressVPN
- [ ] Set up auto update for all my applications
- [ ] Look into Manix CLI

# Notes

[This website](https://home-manager-options.extranix.com/) can be used to search for Home Manager options

Use the command `sudo nixos-rebuild switch --flake ~/Documents/nixConfig/#laptop` to update the NixOS configuration

Use the command `sudo home-manager switch --flake ~/Documents/nixConfig/#fernandorf@laptop` to update the Home Manager configuration