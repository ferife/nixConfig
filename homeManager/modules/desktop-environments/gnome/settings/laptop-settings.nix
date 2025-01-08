{ config, lib, pkgs, ... }:
{
  options = {
		gnomeLaptopSettingsModule.enable = lib.mkEnableOption "Sets certain GNOME settings that only make sense on laptops";
	};

	config = lib.mkIf config.gnomeLaptopSettingsModule.enable {
		dconf.settings = {
      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        send-events = "disabled-on-external-mouse";
      };
    };
	}; 
}
