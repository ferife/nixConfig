{
  config,
  lib,
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  options.hm.specialArgs = {
    user-settings = {
      username = lib.mkOption {
        type = lib.types.strMatching "[^ <>.]+";
        description = "The username for the main user. This will be used for the naming of the home directory, so it must comply with rules for naming non-hidden directories";
        default = "fernandorf";
      };
      name = lib.mkOption {
        type = lib.types.str;
        description = "The name of the user";
        default = "Fernando";
      };
      colorscheme = lib.mkOption {
        type = lib.types.enum ["onedark"];
        description = "The colorscheme that will be used to rice the entire system";
        default = "onedark";
      };
      browser = lib.mkOption {
        type = lib.types.enum ["chromium" "firefox" "floorp" "librewolf" "tor-browser"];
        description = "The main web browser";
        default = "floorp";
      };
      terminal = lib.mkOption {
        type = lib.types.enum ["ghostty" "gnome-console" "gnome-terminal" "kitty"];
        description = "The main terminal emulator for this system";
        default = "ghostty";
      };
      font = {
        name = lib.mkOption {
          type = lib.types.str;
          description = "The name of the font that will be used across the system";
          default = "FiraCode Nerd Font";
        };
        package = lib.mkOption {
          type = lib.types.package;
          description = "The package that will be used for the font";
          default = pkgs.nerd-fonts.fira-code;
        };
      };
    };
    system-settings = {
      system = lib.mkOption {
        type = lib.types.enum ["x86_64-linux"];
        description = "The system architecture of the device";
        default = "x86_64-linux";
      };
      shell = lib.mkOption {
        type = lib.types.enum ["bash" "zsh"];
        description = "The main shell to be used";
        default = "bash";
      };
      hostname = lib.mkOption {
        type = lib.types.strMatching "[^ <>.]+";
        description = "The name of the host device";
        default = "laptop";
      };
      timezone = lib.mkOption {
        type = lib.types.enum ["America/Chicago"];
        description = "The home timezone";
        default = "America/Chicago";
      };
      locale = lib.mkOption {
        type = lib.types.enum ["en_US.UTF-8"];
        description = "The locale";
        default = "en_US.UTF-8";
      };
      config-path = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The absolute path leading to the nix Config";
        default = "/home/fernandorf/Documents/Configs/nixConfig/";
      };
      flake-path = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The absolute path leading to the flake";
        default = "/home/fernandorf/Documents/Configs/nixConfig/nixConfig-main";
      };
      nixpkgs = lib.mkOption {
        type = lib.types.enum ["unstable" "25.11"];
        description = "The toggle to choose between the latest stable or unstable nixpkgs";
        default = "unstable";
      };
      config-files-dir = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The name of the directories where the scripts/assets for this config will be stored. They will be within the home directory and within the /etc directory respectively.";
        default = ".nixConfig-assets";
      };
      scripts-dir = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The name of the directories where the scripts for this config will be stored. They will be within the home directory and within the /etc directory respectively.";
        default = ".nixConfig-assets/scripts";
      };
      assets-dir = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The name of the directories where the assets for this config will be stored. They will be within the home directory and within the /etc directory respectively.";
        default = ".nixConfig-assets/assets";
      };
      desktop-environment = lib.mkOption {
        type = lib.types.enum ["gnome" "hyprland"];
        description = "The main desktop environment to use";
        default = "hyprland";
      };
    };
  };
}
