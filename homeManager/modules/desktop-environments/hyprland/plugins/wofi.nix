{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.wofi {
    programs.wofi = {
      enable = true;
      # settings = {};
    };
  };
}
