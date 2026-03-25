{
  config,
  lib,
  pkgs,
  ...
}: let
  enable-noctalia = config.hm.wm.components.noctalia;
in {
  config = lib.mkMerge [
    (lib.mkIf enable-noctalia {
      programs.noctalia-shell.settings.appLauncher = {
        enableClipboardHistory = true;
      };
    })

    (lib.mkIf (enable-noctalia && config.hm.specialArgs.user-settings.terminal == "ghostty") {
      programs.noctalia-shell.settings.appLauncher.terminalCommand = "${config.programs.ghostty.package}/bin/ghostty";
    })
  ];
}
