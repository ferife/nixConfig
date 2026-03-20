{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.obsidian {
      programs.obsidian = {
        enable = true;
        vaults = {
          test-gen-vault = {
            enable = true;
            target = "Documents/test-git-vault/test-gen-vault";
            # settings = {};
          };
        };
      };
    })

    (lib.mkIf (config.hm.obsidian && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["obsidian.desktop"];};
    })
  ];
}
