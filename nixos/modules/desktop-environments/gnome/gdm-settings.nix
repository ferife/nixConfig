{ config, lib, pkgs, userSettings, ... }:
{
	options = {
		gdmSettings.enable = lib.mkEnableOption "GDM Settings, a settings menu for customizing the login screen";
	};

	config = lib.mkIf config.gdmSettings.enable {
		environment.systemPackages = with pkgs; [
      gdm-settings
    ];
	};
}
