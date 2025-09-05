{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./ghostty.nix
    ./gnome-terminal.nix
    ./kitty.nix
  ];

  hm = {
    ghostty = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "ghostty") true;
    gnome-terminal = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "gnome-terminal") true;
    kitty = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "kitty") true;
  };
}
