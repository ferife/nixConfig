{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.plantuml {
    home.packages = with pkgs; [
      plantuml
      graphviz # Might as well, since it's needed for a few diagram types
    ];
  };
}
