{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.wpaperd && (config.hm.plasma.enable || config.hm.wm.enable)) {
      # Be warned, wpaperd only works with wayland compositors and KDE, not GNOME
      services.wpaperd = {
        enable = true;
        settings = {
          any = {
            duration = "3m";
            sorting = "random";
            mode = "center";
          };
        };
      };
    })

    (lib.mkIf (config.hm.stylix.theme == "onedark") {
      services.wpaperd.settings.any.path = lib.mkForce ../../../generalResources/background-images/onedark;
    })
  ];
}
