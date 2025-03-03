{ config, lib, pkgs, ... }:
{
	options = {
		neofetch.hm.enable = lib.mkEnableOption "Installs & configures Neofetch";
	};

  config = lib.mkMerge [
    (lib.mkIf config.neofetch.hm.enable {
      home.packages = with pkgs; [ neofetch ];
    })

    (lib.mkIf (config.neofetch.hm.enable && config.bash.hm.enable ) {
      programs.bash.initExtra = "neofetch";
    })

    (lib.mkIf (config.neofetch.hm.enable && config.zsh.hm.enable ) {
      programs.zsh.initExtra = "neofetch";
    })
  ];
}
