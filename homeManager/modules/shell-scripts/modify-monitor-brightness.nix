{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.modify-monitor-brightness = {
        source = ../../../generalResources/scripts/modify-monitor-brightness.bash;
        path = "${config.hm.specialArgs.system-settings.scripts-dir}/modify-monitor-brightness.bash";
        full-path = "$HOME/${config.hm.scripts.modify-monitor-brightness.path}";
      };
    }
    (lib.mkIf config.hm.scripts.modify-monitor-brightness.enable {
      home.packages = [pkgs.brightnessctl];

      home.file."${config.hm.scripts.modify-monitor-brightness.path}" = {
        enable = true;
        executable = true;
        source = config.hm.scripts.modify-monitor-brightness.source;
      };
    })
  ];
}
