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

# TODO: Figure out how to use MullvadVPN on NixOS
  # A good idea to look into would be using Distrobox to install the apt version of MullvadVPN
# TODO: Implement Home Manager
# TODO: Add back all the packages I was using
# TODO: Configure GNOME
# TODO: Figure out gaming on NixOS