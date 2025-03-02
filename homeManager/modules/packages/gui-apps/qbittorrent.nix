{ config, lib, pkgs, ... }:
{
	options = {
		qbittorrent.enable = lib.mkEnableOption "Installs & configures QBitTorrent";
	};

	config = lib.mkIf config.qbittorrent.enable {
		home.packages = with pkgs; [
      qbittorrent
    ];
	};
}
