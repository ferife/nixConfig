{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./ghostty.nix
    ./gnome-terminal.nix
    ./kitty.nix
  ];

  hm = {
    ghostty = lib.mkIf (userSettings.terminal == "ghostty") true;
    gnomeTerminal = lib.mkIf (userSettings.terminal == "gnome-terminal") true;
    kitty = lib.mkIf (userSettings.terminal == "kitty") true;
  };
}
