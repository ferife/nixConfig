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
        default = userSettings.username;
      };
      name = lib.mkOption {
        type = lib.types.str;
        description = "The name of the user";
        default = userSettings.name;
      };
      colorscheme = lib.mkOption {
        type = lib.types.enum ["onedark"];
        description = "The colorscheme that will be used to rice the entire system";
        default = userSettings.colorscheme;
      };
      browser = lib.mkOption {
        type = lib.types.enum ["chromium" "firefox" "floorp" "tor-browser"];
        description = "The main web browser";
        default = userSettings.mainBrowser;
      };
      terminal = lib.mkOption {
        type = lib.types.enum ["ghostty" "gnome-terminal" "kitty"];
        description = "The main terminal emulator for this system";
        default = userSettings.terminal;
      };
      font = {
        name = lib.mkOption {
          type = lib.types.str;
          description = "The name of the font that will be used across the system";
          default = userSettings.font;
        };
        package = lib.mkOption {
          type = lib.types.package;
          description = "The package that will be used for the font";
          default = userSettings.fontPkg;
        };
      };
    };
    system-settings = {
      system = lib.mkOption {
        type = lib.types.enum ["x86_64-linux"];
        description = "The system architecture of the device";
        default = systemSettings.system;
      };
      shell = lib.mkOption {
        type = lib.types.enum ["bash" "zsh"];
        description = "The main shell to be used";
        default = systemSettings.shell;
      };
      hostname = lib.mkOption {
        type = lib.types.strMatching "[^ <>.]+";
        description = "The name of the host device";
        default = systemSettings.hostname1;
      };
      timezone = lib.mkOption {
        type = lib.types.enum ["America/Chicago"];
        description = "The home timezone";
        default = systemSettings.timezone;
      };
      locale = lib.mkOption {
        type = lib.types.enum ["en_US.UTF-8"];
        description = "The locale";
        default = systemSettings.locale;
      };
      config-path = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The absolute path leading to the nix Config";
        default = systemSettings.nixConfigPath;
      };
      flake-path = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The absolute path leading to the flake";
        default = systemSettings.flakePath;
      };
      nixpkgs = lib.mkOption {
        type = lib.types.enum ["unstable" "25.05"];
        description = "The toggle to choose between the latest stable or unstable nixpkgs";
        default = systemSettings.nixpkgs;
      };
      config-files-dir = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The name of the directories where the scripts/assets for this config will be stored. They will be within the home directory and within the /etc directory respectively.";
        default = systemSettings.configFilesDirectory;
      };
      scripts-dir = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The name of the directories where the scripts for this config will be stored. They will be within the home directory and within the /etc directory respectively.";
        default = systemSettings.scriptsDirectory;
      };
      assets-dir = lib.mkOption {
        type = lib.types.strMatching "[^ <>]+";
        description = "The name of the directories where the assets for this config will be stored. They will be within the home directory and within the /etc directory respectively.";
        default = systemSettings.assetsDirectory;
      };
      desktop-environment = lib.mkOption {
        type = lib.types.enum ["gnome" "hyprland"];
        description = "The main desktop environment to use";
        default = systemSettings.desktopEnvironment;
      };
    };
  };
}
