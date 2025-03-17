{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.nixos.neofetch {
		environment.systemPackages = with pkgs; [ neofetch ];
	};
}
