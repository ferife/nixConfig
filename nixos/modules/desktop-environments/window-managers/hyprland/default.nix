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

  # TODO: Use ONE of the two following lines to install a program to control screen light
  # programs.light.enable = true;
  config.environment.systemPackages = [pkgs.brightnessctl];
}
