

{ config, lib, pkgs, ... }:
{
	options = {
		openrazerModule.enable = lib.mkEnableOption "Installs & configures OpenRazer";
	};

	config = lib.mkIf config.openrazerModule.enable {
		
    # The following lines are required for OpenRazer
    hardware.openrazer.enable = true; # Enable OpenRazer drivers
    users.users.fernandorf.extraGroups = [ "openrazer" ];
    # TODO: Make it so that the users added to the "OpenRazer" extraGroups can be controlled programmatically

    environment.systemPackages = with pkgs; [
      openrazer-daemon  # self-explanatory
      polychromatic     # front-end for controlling Razer peripheral LEDs
    ];
	};
}