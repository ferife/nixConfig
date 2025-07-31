{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.hm.obsidian {
    home.packages = with pkgs-unstable; [
      obsidian
    ];
  };
}
