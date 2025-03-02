{ config, lib, pkgs, ... }:
{
	options = {
		distrobox.enable = lib.mkEnableOption "Installs & configures Distrobox";
	};

	config = lib.mkIf config.distrobox.enable {
		environment.systemPackages = with pkgs; [
      distrobox
    ];

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
	};
}
