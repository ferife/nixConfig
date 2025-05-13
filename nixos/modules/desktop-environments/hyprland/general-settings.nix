{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    hyprland.settings.enable = lib.mkEnableOption "Basic NixOS config for Hyprland that needed to happen outside of Home Manager";
  };

  config = lib.mkIf config.hyprland.settings.enable {
    # nix.settings = {
    #   substituters = ["https://hyprland.cachix.org"];
    #   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    # };
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    environment.variables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
