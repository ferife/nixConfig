{ config, lib, pkgs, ... }:
{
	options = {
		openrazerModule.enable = lib.mkEnableOption "Installs & configures OpenRazer";
	};

	config = lib.mkIf config.openrazerModule.enable {

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
