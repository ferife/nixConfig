{ config, lib, pkgs, ... }:
{
	options = {
		qbittorrentModule.enable = lib.mkEnableOption "Installs & configures QBitTorrent";
	};

	config = lib.mkIf config.qbittorrentModule.enable {
		environment.systemPackages = with pkgs; [
      qbittorrent
    ];
	};
}