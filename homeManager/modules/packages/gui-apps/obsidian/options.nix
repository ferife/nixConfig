{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    obsidian = mkEnableOption "Obsidian.md";
  };
}
