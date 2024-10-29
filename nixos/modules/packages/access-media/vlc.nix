{ config, lib, pkgs, ... }:
{
	options = {
		vlcModule.enable = lib.mkEnableOption "Installs & configures VLC";
	};

	config = lib.mkIf config.openrazerModule.enable {
		environment.systemPackages = with pkgs; [
      vlc
    ];
	};
}