{inputs, ...}: {
  # This module adds functionality to the f-keys
  #
  # flake.modules.nixos.hyprland = {pkgs, ...}: {};

  flake.modules.homeManager.hyprland = {
    lib,
    pkgs,
    ...
  }: {
    wayland.windowManager.hyprland.settings = let
      brightnessctl = "${lib.getExe pkgs.brightnessctl}";
      playerctl = "${lib.getExe pkgs.playerctl}";
      wpctl = "${pkgs.wireplumber}/bin/wpctl";
    in {
      bindd = [
        ", XF86AudioMute, Toggle mute, exec, ${wpctl} set-mute @DEFAULT_SINK@ toggle" #F1
        ", XF86AudioPrev, Go to previous audio track, exec, ${playerctl} previous" #F4
        ", XF86AudioPlay, Play/pause audio track, exec, ${playerctl} play-pause" #F5
        ", XF86AudioNext, Go to next audio track, exec, ${playerctl} next" #F6
        # F9 is for some reason registering as Super key
        # ", XF86RFKill, Toggle radios (AKA toggle airplane mode), exec, blablabla" #F10
        # ", Print, Print Screen (AKA take screenshot), exec, blablabla" #F11
        # ", XF86AudioMedia, blabla, exec, blabla" #F12
      ];
      bindde = [
        ", XF86AudioRaiseVolume, Raise volume, exec, ${wpctl} set-volume @DEFAULT_SINK@ 5%+" #F2
        ", XF86AudioLowerVolume, Lower volume, exec, ${wpctl} set-volume @DEFAULT_SINK@ 5%-" #F3
        ", XF86MonBrightnessUp, Increase Brightness, exec, ${brightnessctl} set 5%+" #F7
        ", XF86MonBrightnessDown, Decrease Brightness, exec, ${brightnessctl} set 5%-" #F8
      ];
    };
  };
}
