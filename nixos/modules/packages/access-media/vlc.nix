{ config, lib, pkgs, ... }:
{
	options = {
		vlcModule.enable = lib.mkEnableOption "Installs & configures VLC";
	};

	config = lib.mkIf config.vlcModule.enable {
		environment.systemPackages = with pkgs; [
      vlc
    ];
	};
}