{ config, lib, pkgs, ... }:
{
	options = {
		distroboxModule.enable = lib.mkEnableOption "Installs & configures Distrobox";
	};

	config = lib.mkIf config.distroboxModule.enable {
		environment.systemPackages = with pkgs; [
      distrobox
    ];

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
	};
}