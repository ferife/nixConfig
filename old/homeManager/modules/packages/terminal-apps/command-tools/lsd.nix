{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.lsd) {
      programs.lsd.enable = true;
    })

    # Avoid clashing with eza aliases
    (lib.mkIf (config.hm.lsd && !config.hm.eza) {
      programs.lsd.enableAliases = true;
    })
  ];
}
