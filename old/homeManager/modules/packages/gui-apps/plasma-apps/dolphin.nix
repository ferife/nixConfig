{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.hm.dolphin && !(config.hm.plasma.enable)) {
    home.packages = [pkgs.kdePackages.dolphin];
  };
}
