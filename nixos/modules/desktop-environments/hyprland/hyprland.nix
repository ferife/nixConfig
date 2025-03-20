{ config, lib, pkgs, inputs, ... }:
{
	config = lib.mkIf config.nixos.hyprland.enable {
    # nix.settings = {
    #   substituters = ["https://hyprland.cachix.org"];
    #   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    # };
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    environment.variables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
