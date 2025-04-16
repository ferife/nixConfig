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
  # TODO: Figure out if I can use home manager to manage the configurations of obsidian, or at least put my obsidian configuration into a git repo
}
