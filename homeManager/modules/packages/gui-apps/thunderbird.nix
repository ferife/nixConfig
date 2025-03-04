{ config, lib, pkgs, userSettings, ... }:
{
	options = {
		thunderbird.enable = lib.mkEnableOption "Installs & configures Thunderbird";
	};

	config = lib.mkIf config.thunderbird.enable {
    # programs.thunderbird = {
    #   enable = true;
    #   profiles.${userSettings.username}.name = "Fernando RF";
    # };
    home.packages = with pkgs; [
      thunderbird
    ];
	};
}
# TODO: Switch to programs.thunderbird.enable
