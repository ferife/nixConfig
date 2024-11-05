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
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };
          modules = [
            ./nixos/hosts/laptop/configuration.nix
          ];
        };
        device2 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };
          modules = [
            ./nixos/hosts/device2/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        "fernandorf@laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit system; };
          modules = [
            ./homeManager/hosts/laptop/home.nix
          ];
        };
        "fernandorf@device2" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit system; };
          modules = [
            ./homeManager/hosts/device2/home.nix
          ];
        };
      };
    };  
}