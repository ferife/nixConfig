{
  description = "A flake for my NixOS configuration";
  # Shown in the CLI by the `nix flake metadata` command

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05"; # Stable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; # Unstable

    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      # url = "github:nix-community/home-manager?ref=release-25.05"; # Stable
      url = "github:nix-community/home-manager"; # Unstable
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix.url = "github:danth/stylix/release-25.05"; # Stable
    stylix.url = "github:danth/stylix"; # Unstable

    nixvim-config = {
      url = "github:ferife/nvimConfig";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };
  # NOTE: To update a single input, use the command `nix flake update <name-of-input>`

  # TODO: Look into the disko tool for disk paritioning. Could I use it to install multiple OS's into a single disk device?
  # TODO: Look into NixOS overlays

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    stylix,
    nixos-hardware,
    ...
  } @ inputs: let
    userSettings = {
      username = "fernandorf";
      name = "Fernando";
      colorscheme = "onedark";
      mainBrowser = "floorp"; # Options: firefox, floorp
      terminal = "kitty"; # Options: gnome terminal, kitty
      font = "FiraCode Nerd Font";
      fontPkg = pkgs.nerd-fonts.fira-code;
    };
    systemSettings = rec {
      system = "x86_64-linux";
      shell = "bash";
      hostname1 = "laptop";
      hostname2 = "device2";
      timezone = "America/Chicago";
      locale = "en_US.UTF-8";
      nixConfigPath = "/home/${userSettings.username}/Documents/Configs/nixConfig";
      flakePath = "${nixConfigPath}/nixConfig-main";
      nixpkgs = "unstable"; # Options: unstable, stable
      configFilesDirectory = ".nixConfig-assets";
      scriptsDirectory = "${configFilesDirectory}/scripts";
      assetsDirectory = "${configFilesDirectory}/assets";
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
          nixos-hardware.nixosModules.framework-11th-gen-intel
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
          stylix.homeModules.stylix
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
          stylix.homeModules.stylix
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

