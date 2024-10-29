{ config, lib, pkgs, ... }:
{
	options = {
		qbittorrentModule.enable = lib.mkEnableOption "Installs & configures QBitTorrent";
	};

	config = lib.mkIf config.openrazerModule.enable {
		environment.systemPackages = with pkgs; [
      qbittorrent
    ];
	};
}