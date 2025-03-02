{ config, lib, pkgs, ... }:
{
	options = {
		gaming.openrazer.enable = lib.mkEnableOption "Installs & configures OpenRazer";
	};

	config = lib.mkIf config.gaming.openrazer.enable {
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
