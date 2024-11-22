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
- [x] Create the options necessary for multiple devices to make use of this setup
- [x] Set up auto update for all my applications

- [ ] Add Whatsapp access to the computer for communicating with mom
- [ ] Figure out if there's a way to add my Obsidian plugin & settings setup to my flake, or at least to a git repo
- [ ] Set up a password management solution
- [ ] Cancel my subsctiption to ExpressVPN
- [ ] Look into Manix CLI
- [ ] Separate out the packages into ones that are core components needed by all users of the computer and everything else
    - The core components should be installed by NixOS
    - Everything else should be installed by Home Manager
    - This limits the amount of packages that have privileged access
- [ ] In openrazer.nix, make it so that the users added to the "openrazer" extraGroup is dependent on the users in the current host (AKA make it programmatic)
- [ ] Figure out if I can use home manager to manage the configurations of obsidian and neovim, since home manager is all about managing dotfiles
- [ ] Set up a way to handle secrets so I don't accidentally put passwords in my public repo
- [ ] Set up a bash script that will use the Mullvad VPN CLI to set up my account
  - I should only do it once I've set up secrets so that I don't put my private MullvadVPN account on my public repo like an idiot
- [ ] Set things up in such a way that it's easy to switch desktop environments or window managers

# Commands

- Rebuild the system after changing the configuration: `nh os switch -aH laptop`
- Upgrade nixpkgs and rebuild `nh os switch -auH laptop`
- Rebuild home-manager after changing the configuration: `nh home switch -ac fernandorf@laptop`
- Rebuild to test a program or make a temporary change: `nh os test -aH laptop`
- Clean up my storage: `nh clean all -ak 10`

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