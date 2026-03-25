{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  enable-noctalia = config.hm.wm.components.noctalia;
in {
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia-modules
  ];

  config = lib.mkMerge [
    (lib.mkIf enable-noctalia {
      programs.noctalia-shell = {
        enable = true;
      };
    })
    (lib.mkIf (enable-noctalia && config.hm.wm.hyprland.enable) {
      wayland.windowManager.hyprland.extraConfig = "exec-once = noctalia-shell";
    })
  ];
}
