{ config, lib, pkgs, ... }:
{
	options = {
		torBrowser.enable = lib.mkEnableOption "Installs & configures the Tor browser";
	};

	config = lib.mkIf config.torBrowser.enable {
		home.packages = with pkgs; [
      tor-browser
    ];

    # services.tor = {
    #   enable = true;
    # };
	};
}
