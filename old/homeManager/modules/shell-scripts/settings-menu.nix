{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.settings-menu = {
        source = ../../../generalResources/scripts/settings-menu.bash;
        path = "${config.hm.specialArgs.system-settings.scripts-dir}/settings-menu.bash";
        full-path = "$HOME/${config.hm.scripts.settings-menu.path}";
      };
    }
    (lib.mkIf config.hm.scripts.settings-menu.enable {
      home.file."${config.hm.scripts.settings-menu.path}" = {
        enable = true;
        executable = true;
        source = config.hm.scripts.settings-menu.source;
      };
    })
  ];
}
