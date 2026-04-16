{inputs, ...}: {
  flake.modules.homeManager.noctalia = {
    lib,
    pkgs,
    ...
  }: {
    programs.noctalia-shell.settings.appLauncher = {
      enableClipboardHistory = true;
      terminalCommand = "${lib.getExe pkgs.ghostty}";
    };
  };
}
