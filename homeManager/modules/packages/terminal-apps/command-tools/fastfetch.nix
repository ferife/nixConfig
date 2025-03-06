{ config, lib, pkgs, ... }:
{
	options = {
		fastfetch.hm.enable = lib.mkEnableOption "Installs & configures fastfetch";
	};

  config = lib.mkMerge [
    (lib.mkIf config.fastfetch.hm.enable {
      programs.fastfetch = {
        enable = true;
        # settings =
      };
      home.shellAliases = {
        "neofetch" = "echo 'executing fastfetch' && fastfetch";
      };
    })

    (lib.mkIf (config.fastfetch.hm.enable && config.bash.hm.enable ) {
      programs.bash.initExtra = "fastfetch";
    })

    (lib.mkIf (config.fastfetch.hm.enable && config.zsh.hm.enable ) {
      programs.zsh.initExtra = "fastfetch";
    })
  ];
}
