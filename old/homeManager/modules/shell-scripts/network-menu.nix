{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.network-menu = {
        source = ../../../generalResources/scripts/network-menu.bash;
        path = "${config.hm.specialArgs.system-settings.scripts-dir}/network-menu.bash";
        full-path = "$HOME/${config.hm.scripts.network-menu.path}";
      };
    }
    (lib.mkIf config.hm.scripts.network-menu.enable {
      home.file."${config.hm.scripts.network-menu.path}" = {
        enable = true;
        executable = true;
        source = config.hm.scripts.network-menu.source;
      };
    })
  ];
}
