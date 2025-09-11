{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.mullvad {
      programs.mullvad-vpn = {
        enable = true;
        # settings = {};
      };
    })

    (lib.mkIf (config.hm.mullvad && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["mullvad-vpn.desktop"];};
    })
  ];
}
