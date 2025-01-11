{ config, lib, pkgs, ... }:
{
	options = {
		dustModule.enable = lib.mkEnableOption "Installs & configures dust, a TUI disk space visualizing tool";
	};

	config = lib.mkIf config.dustModule.enable {
    home.packages = with pkgs; [ dust ];
	};
}
