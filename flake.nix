# The command to rebuild is
# sudo nixos-rebuild switch --flake ~/Documents/nixConfig/#laptop

{
  description = "A flake for my NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };
    };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  
}

# TODO: Implement Home Manager
  # Link for searching home manager options: https://home-manager-options.extranix.com/
# TODO: Make my configuration more modular
# TODO: Add back all the packages I was using
# TODO: Configure GNOME - Use Home Manger for this
# TODO: Figure out if there's a way to add my Obsidian plugin & settings setup to my flake, or at least to a git repo
# TODO: Figure out gaming on NixOS
# TODO: Make this a remote repo
# TODO: Set up a password management solution
# TODO: Cancel my subsctiption to ExpressVPN
# TODO: Set up NixOS auto update
# TODO: Set up auto update for all my applications
# TODO: Look into Manix CLI