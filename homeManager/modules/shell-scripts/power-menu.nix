{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.power-menu = {
        source = ../../../generalResources/scripts/power-menu.bash;
        path = "${config.hm.specialArgs.system-settings.scripts-dir}/power-menu.bash";
        full-path = "$HOME/${config.hm.scripts.power-menu.path}";
      };
    }
    (lib.mkIf config.hm.scripts.power-menu.enable {
      home.file."${config.hm.scripts.power-menu.path}" = {
        enable = true;
        executable = true;
        source = config.hm.scripts.power-menu.source;
      };
    })
  ];
}
