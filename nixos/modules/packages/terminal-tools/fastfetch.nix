{ config, lib, pkgs, ... }:
{
	options = {
		fastfetch.nixos.enable = lib.mkEnableOption "Installs & configures Fastfetch";
	};

	config = lib.mkIf config.fastfetch.nixos.enable {
		environment.systemPackages = with pkgs; [ fastfetch ];
	};
}
