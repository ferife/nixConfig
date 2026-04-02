{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.proton-mail {
      # This module refers to apps by the company Proton, as in Proton Mail, Proton Calendar, etc.
      # This does NOT refer to Proton, the program maintained by Valve that allows games made for Windows to run on Linux

      home.packages = with pkgs; [
        protonmail-desktop
      ];
    })

    (lib.mkIf (config.hm.proton-mail && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["proton-mail.desktop"];};
    })
  ];
}
