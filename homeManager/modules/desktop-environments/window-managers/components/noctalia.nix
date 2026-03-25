{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  noctalia = config.hm.wm.components.noctalia.enable;
in {
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia-modules
  ];

  config = lib.mkMerge [
    (lib.mkIf noctalia {
      programs.noctalia-shell = {
        enable = true;
      };
    })
    (lib.mkIf (noctalia && config.hm.wm.hyprland.enable) {
      wayland.windowManager.hyprland.extraConfig = "exec-once = noctalia-shell";
    })
  ];
}
