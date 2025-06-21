{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.wm.app-launcher == "wofi") {
      hm.wm.components.wofi = lib.mkForce true;
    })
    (lib.mkIf config.hm.wm.components.wofi {
      programs.wofi = {
        enable = true;
        # settings = {};
      };
    })
  ];
}
