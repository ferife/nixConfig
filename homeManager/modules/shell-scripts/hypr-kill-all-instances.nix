{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.hypr-kill-all-instances = {
        source = ../../../generalResources/scripts/hypr-kill-all-instances.bash;
        path = "${config.hm.specialArgs.system-settings.scripts-dir}/hypr-kill-all-instances.bash";
        full-path = "$HOME/${config.hm.scripts.hypr-kill-all-instances.path}";
      };
    }
    (lib.mkIf config.hm.scripts.hypr-kill-all-instances.enable {
      home.file."${config.hm.scripts.hypr-kill-all-instances.path}" = {
        enable = true;
        executable = true;
        source = config.hm.scripts.hypr-kill-all-instances.source;
      };
    })
  ];
}
