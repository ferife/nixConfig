{ config, lib, pkgs, ... }:
{
	options = {
		vlc.enable = lib.mkEnableOption "Installs & configures VLC";
	};

	config = lib.mkIf config.vlc.enable {
		home.packages = with pkgs; [
      vlc
    ];
	};
}
