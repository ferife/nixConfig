{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    # ./gas.nix
  ];

  # hm = {
  #   gnomeTerminal = lib.mkIf (userSettings.terminal == "gnome terminal") true;
  #   kitty = lib.mkIf (userSettings.terminal == "kitty") true;
  # };
}
