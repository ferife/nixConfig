{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.nixos.wm.hyprland.enable {
    # nix.settings = {
    #   substituters = ["https://hyprland.cachix.org"];
    #   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    # };
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    programs.hyprlock.enable = true;
  };
}
