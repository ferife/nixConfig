{
  description = "A flake for my NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      # NixOS Configuration Entrypoint
      # Available through 'sudo nixos-rebuild switch --flake ~/Documents/nixConfig/#laptop'
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager switch --flake ~/Documents/nixConfig/#fernandorf@laptop'
      homeConfigurations = {
        "fernandorf@laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit system; };
          modules = [
            ./homeManager/home.nix
          ];
        };
      };
    };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  
}

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

# Useful tools
# mynixos.com - For searching nix options





