{ config, lib, pkgs, ... }:
{
	options = {
		mullvadVpn.enable = lib.mkEnableOption "Installs & configures Mullvad VPN";
	};

	config = lib.mkIf config.mullvadVpn.enable {
		environment.systemPackages = with pkgs; [
      mullvad     # CLI
      mullvad-vpn # GUI
    ];
    networking.firewall.checkReversePath = "loose";
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
    };
	};
}
# TODO: Set a bash script that will auto log me in to my Mullvad account
