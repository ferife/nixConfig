{ config, lib, pkgs, ... }:
{
	options = {
		gnome.settings.enable = lib.mkEnableOption "Basic NixOS config for GNOME that needed to happen outside of Home Manager";
	};

	config = lib.mkIf config.gnome.settings.enable {
    services.gnome.gnome-browser-connector.enable = true; # Allows for GNOME extensions to affect browsers
	};
}
