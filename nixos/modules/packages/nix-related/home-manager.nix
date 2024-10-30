{ config, lib, pkgs, ... }:
{
	options = {
		homeManagerModule.enable = lib.mkEnableOption "Installs & configures Home Manager";
	};

	config = lib.mkIf config.homeManagerModule.enable {
		environment.systemPackages = with pkgs; [
      home-manager
    ];
	};
}