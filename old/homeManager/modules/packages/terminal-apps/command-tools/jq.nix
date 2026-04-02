{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.jq {
    programs.jq = {
      enable = true;
    };
  };
}
