{ config, lib, pkgs, ... }:
{
  config = lib.mkMerge [
    (lib.mkIf config.hm.neofetch {
      home.packages = with pkgs; [ neofetch ];
    })

    (lib.mkIf (config.hm.neofetch && config.hm.bash ) {
      programs.bash.initExtra = "neofetch";
    })

    (lib.mkIf (config.hm.neofetch && config.hm.zsh ) {
      programs.zsh.initExtra = "neofetch";
    })
  ];
}
