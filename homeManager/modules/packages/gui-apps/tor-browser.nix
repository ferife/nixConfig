{ config, lib, pkgs, ... }:
{
	options = {
		torBrowserModule.enable = lib.mkEnableOption "Installs & configures the Tor browser";
	};

	config = lib.mkIf config.torBrowserModule.enable {
		home.packages = with pkgs; [
      tor-browser
    ];

    # services.tor = {
    #   enable = true;
    # };
	};
}