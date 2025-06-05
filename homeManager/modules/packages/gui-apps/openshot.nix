{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.hm.openshot {
    home.packages = with pkgs-unstable; [
      openshot-qt
    ];
  };
  # TODO: Figure out if I can use home manager to manage the configurations of obsidian, or at least put my obsidian configuration into a git repo
}
