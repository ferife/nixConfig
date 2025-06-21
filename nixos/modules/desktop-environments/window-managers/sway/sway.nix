{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.nixos.wm.sway.enable {
    programs.sway = {
      enable = true;
      xwayland.enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        brightnessctl
        grim
        kitty
        pipewire
        rofi-wayland
        swayidle
        swaylock
        wireplumber
      ];
    };

    # TODO: Use ly as the display manager (login manager)
  };
}
