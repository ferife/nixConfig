{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.sway.enable {
    # hint Electron apps to use Wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.sway = {
      enable = true;
      swaynag.enable = true; # error bar
      systemd.enable = true;
      wrapperFeatures.gtk = true;

      config = {
        workspaceAutoBackAndForth = true;
        output.eDP-1 = {scale = "1";};
        bars = [];
      };
    };
  };
}
