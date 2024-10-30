{ config, lib, pkgs, ... }:
{
	options = {
		mullvadVpnModule.enable = lib.mkEnableOption "Installs & configures Mullvad VPN";
	};

	config = lib.mkIf config.mullvadVpnModule.enable {
		environment.systemPackages = with pkgs; [
      mullvad-vpn
    ];
		
    networking.firewall.checkReversePath = "loose";
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
    };
	};
}