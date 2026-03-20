{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.grep.options && !config.hm.ripgrep) {
      home.shellAliases = {
        "grep" = "grep --color";
      };
    })
  ];
}
