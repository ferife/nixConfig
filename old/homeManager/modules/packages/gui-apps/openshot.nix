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
}
