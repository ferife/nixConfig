

{ config, lib, pkgs, ... }:
{
	options = {
		openrazerModule.enable = lib.mkEnableOption "Installs & configures OpenRazer";
	};

	config = lib.mkIf config.openrazerModule.enable {
		
    # hardware.openrazer.enable = true; # Enable OpenRazer drivers
    # users.users.fernandorf.extraGroups = [ "openrazer" ];

    # TODO: Test to make sure that the programmatic way of doing it below can replace the imperative way obove
    hardware.openrazer = {
      enable = true;
      users = [
        "fernandorf"
      ];
    };
    

    environment.systemPackages = with pkgs; [
      openrazer-daemon  # self-explanatory
      polychromatic     # front-end for controlling Razer peripheral LEDs
    ];
	};
}