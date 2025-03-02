{ config, lib, pkgs, ... }:
{
	options = {
		dust.enable = lib.mkEnableOption "Installs & configures dust, a TUI disk space visualizing tool";
	};

	config = lib.mkIf config.dust.enable {
    home.packages = with pkgs; [ dust ];
	};
}
