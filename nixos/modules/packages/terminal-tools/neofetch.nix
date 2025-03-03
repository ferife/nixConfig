{ config, lib, pkgs, ... }:
{
	options = {
		neofetch.nixos.enable = lib.mkEnableOption "Installs & configures Neofetch";
	};

	config = lib.mkIf config.neofetch.nixos.enable {
		environment.systemPackages = with pkgs; [ neofetch ];
	};
}
