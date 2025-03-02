{ config, lib, pkgs, ... }:
{
	options = {
		homeManager.enable = lib.mkEnableOption "Home Manager";
	};

	config = lib.mkIf config.homeManager.enable {
		environment.systemPackages = with pkgs; [
      home-manager
    ];
	};
}
