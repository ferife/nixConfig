{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      hm.scripts.modify-volume = {
        source = let
          script-start = "#!/usr/bin/env bash\nsound_file=\"$HOME/${config.hm.specialArgs.system-settings.assets-dir}/volume-test.mp3\"";
        in "${script-start}\n\n${builtins.readFile ../../../generalResources/scripts/modify-volume.bash}";

        path = "${config.hm.specialArgs.system-settings.scripts-dir}/modify-volume.bash";
        full-path = "$HOME/${config.hm.scripts.modify-volume.path}";
      };
    }
    (lib.mkIf config.hm.scripts.modify-volume.enable {
      home.packages = [pkgs.bc];

      home.file."${config.hm.scripts.modify-volume.path}" = {
        enable = true;
        executable = true;
        # source = config.hm.scripts.modify-volume.source;
        text = config.hm.scripts.modify-volume.source;
      };
      home.file."${config.hm.specialArgs.system-settings.assets-dir}/volume-test.mp3" = {
        enable = true;
        source = ../../../generalResources/audio-files/balatro-chips2.mp3;
      };
    })
  ];
}
