{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.plasma.enable {
    qt = {
      enable = true;
    };
  };
}
