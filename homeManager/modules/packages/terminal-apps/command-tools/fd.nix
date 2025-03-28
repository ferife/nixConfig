{
  config,
  lib,
  pkgs,
  ...
}: {

  config = lib.mkIf config.hm.fd {
    programs.fd = {
      enable = true;
      hidden = true;
      ignores = [
        ".git/"
        "*.bak"
      ];
    };
  };
}
