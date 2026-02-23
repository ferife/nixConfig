{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.grep.options {
    home.shellAliases = {
      "grep" = "grep --color";
    };
  };
}
