{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./settings
    ./hyprland.nix
  ];

  config.hm.wm.hyprland.enable = lib.mkIf (config.hm.wm.window-manager == "hyprland") config.hm.wm.enable;
}
