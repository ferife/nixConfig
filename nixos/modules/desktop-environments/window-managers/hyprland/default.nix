{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./hyprland.nix
  ];

  config.nixos.wm.hyprland.enable = lib.mkIf (config.nixos.wm.window-manager == "hyprland") config.nixos.wm.enable;

  config.environment.systemPackages = [pkgs.brightnessctl];
}
