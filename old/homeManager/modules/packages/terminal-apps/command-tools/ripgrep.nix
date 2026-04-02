{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.ripgrep {
    programs.ripgrep = {
      enable = true;
    };
    home.shellAliases = {
      "grep" = "rg";
    };
  };
}
