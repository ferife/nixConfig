{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.nixos.homeManager {
		environment.systemPackages = with pkgs; [
      home-manager
    ];
	};
}
