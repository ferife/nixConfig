{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./sway.nix
  ];

  # config.nixos.wm.sway.enable = lib.mkIf (config.nixos.wm.window-manager == "sway") config.nixos.wm.enable;
  config.nixos.wm.sway.enable = config.nixos.wm.enable;

  # TODO: Use ONE of the two following lines to install a program to control screen light
  # programs.light.enable = true;
  config.environment.systemPackages = [pkgs.brightnessctl];
}
