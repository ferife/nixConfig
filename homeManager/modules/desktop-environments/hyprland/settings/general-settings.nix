{ config, lib, pkgs, inputs, ... }:
let
  # startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
  #   ${pkgs.waybar}/bin/waybar &
  # '';
in {
  config = lib.mkIf config.hm.hyprland.generalSettings.enable {

    home.sessionVariables.NIXOS_OZONE_WL = "1";
    # hint Electron apps to use Wayland

    wayland.windowManager.hyprland = {
      # allow home manager to configure hyprland
      enable = true;

      # plugins = [
      #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus
      # ];

      settings = {

        "plugin:borders-plus-plus" = {
          add_borders = 1;

          "col.border_1" = "rgb(ffffff)";
          "col.border_2" = "rgb(2222ff)";
        };
        border_size_1 = 10;
        border_size_2 = -1;

        natural_rounding = "yes";
      };
    };

    programs.waybar = {
      enable = true;
      # settings = {};
    };
  };
}
