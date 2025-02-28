{
  description = "A flake for my NixOS configuration";
  # Shown in the CLI by the `nix flake metadata` command

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.11";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config = {
      url = "github:ferife/nvimConfig";
    };
  };
  # To update a single input, use the command `nix flake update <name-of-input>`

  # TODO: Figure out how to switch from GNOME to Hyprland
  # TODO: Set up a way to easily switch desktop environments
  # TODO: Look into NixOS overlays

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      # NixOS Configuration Entrypoint
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit pkgs-unstable;
          };
          modules = [
            ./nixos/hosts/laptop/configuration.nix
            stylix.nixosModules.stylix
          ];
        };
        device2 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit pkgs-unstable;
          };
          modules = [
            ./nixos/hosts/device2/configuration.nix
            stylix.nixosModules.stylix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        "fernandorf@laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = {
            inherit system;
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            ./homeManager/hosts/laptop/home.nix
            stylix.homeManagerModules.stylix
          ];
        };
        "fernandorf@device2" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = {
            inherit system;
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            ./homeManager/hosts/device2/home.nix
            stylix.homeManagerModules.stylix
          ];
        };
      };
    };
}

# To install packages from both stable and unstable
# environment.systemPackages =
#   (with pkgs; [
#     STABLE PACKAGES
#   ])
#   ++
#   (with pkgs-unstable; [
#     UNSTABLE PACKAGES
#   ]);
