{ config, lib, pkgs, ... }:
{
	options = {
		neofetch.enable = lib.mkEnableOption "Installs & configures Neofetch";
	};

	config = lib.mkIf config.neofetch.enable {
		environment.systemPackages = with pkgs; [ neofetch ];
	};
}
