{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.fastfetch {
      programs.fastfetch = {
        enable = true;
        # settings =
      };
    })

    (lib.mkIf (config.hm.fastfetch && ! config.hm.neofetch) {
      home.shellAliases = {
        "neofetch" = "echo 'executing fastfetch' && fastfetch";
      };
    })

    (lib.mkIf (config.hm.fastfetch && config.hm.bash) {
      programs.bash.initExtra = "fastfetch";
    })

    (lib.mkIf (config.hm.fastfetch && config.hm.zsh) {
      programs.zsh.initExtra = "fastfetch";
    })
  ];
}
# TODO: Look into fastfetch configuration settings

