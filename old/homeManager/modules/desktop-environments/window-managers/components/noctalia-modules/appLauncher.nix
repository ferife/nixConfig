{
  config,
  lib,
  pkgs,
  ...
}: let
  noctalia = config.hm.wm.components.noctalia.enable;
in {
  config = lib.mkMerge [
    (lib.mkIf noctalia {
      programs.noctalia-shell.settings.appLauncher = {
        enableClipboardHistory = true;
      };
    })

    (lib.mkIf (noctalia && config.hm.specialArgs.user-settings.terminal == "ghostty") {
      programs.noctalia-shell.settings.appLauncher.terminalCommand = "${config.programs.ghostty.package}/bin/ghostty";
    })
  ];
}
