{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.bluetooth-toggle = {
        source = ../../../generalResources/scripts/bluetooth-toggle.bash;
        path = "${config.hm.specialArgs.system-settings.scripts-dir}/bluetooth-toggle.bash";
        full-path = "$HOME/${config.hm.scripts.bluetooth-toggle.path}";
      };
    }
    (lib.mkIf config.hm.scripts.bluetooth-toggle.enable {
      home.file."${config.hm.scripts.bluetooth-toggle.path}" = {
        enable = true;
        executable = true;
        source = config.hm.scripts.bluetooth-toggle.source;
      };
    })
  ];
}
