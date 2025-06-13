{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.yazi {
    programs.yazi = {
      enable = true;
      settings = {
        mgr.show_hidden = true;
      };
    };
  };
}
