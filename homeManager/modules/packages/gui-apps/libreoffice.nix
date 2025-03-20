{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.libreoffice {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
