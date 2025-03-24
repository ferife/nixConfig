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

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    userSettings = {
      username = "fernandorf";
      name = "Fernando";
      colorscheme = "onedark";
      mainBrowser = "floorp"; # Options: firefox, floorp
      terminal = "kitty"; # Options: gnome terminal, kitty
      font = "FiraCode Nerd Font";
      fontPkg = pkgs.fira-code-nerdfont;
    };
    systemSettings = rec {
      system = "x86_64-linux";
      shell = "bash";
      hostname1 = "laptop";
      hostname2 = "device2";
      timezone = "America/Chicago";
      locale = "en_US.UTF-8";
      nixConfigPath = "/home/${userSettings.username}/Documents/Configs/nixConfig/";
      flakePath = "${nixConfigPath}/nixConfig-shell-scripts";
    };

    pkgs = import nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = import nixpkgs-unstable {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    # NixOS Configuration Entrypoint
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = systemSettings.system;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          (./. + "/nixos/hosts/${systemSettings.hostname1}/configuration.nix")
          stylix.nixosModules.stylix
        ];
      };
      device2 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = systemSettings.system;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          (./. + "/nixos/hosts/${systemSettings.hostname2}/configuration.nix")
          stylix.nixosModules.stylix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    homeConfigurations = {
      "${userSettings.username}@${systemSettings.hostname1}" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          system = systemSettings.system;
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          (./. + "/homeManager/hosts/${systemSettings.hostname1}/home.nix")
          ./homeManager/hosts/laptop/home.nix
          stylix.homeManagerModules.stylix
        ];
      };
      "${userSettings.username}@${systemSettings.hostname2}" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          system = systemSettings.system;
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit systemSettings;
          inherit userSettings;
        };
        modules = [
          (./. + "/homeManager/hosts/${systemSettings.hostname2}/home.nix")
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

