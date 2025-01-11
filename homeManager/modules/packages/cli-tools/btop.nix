{ config, lib, pkgs, ... }:
{
	options = {
		btopModule.enable = lib.mkEnableOption "Installs & configures btop, a detailed TUI resource monitor";
	};

	config = lib.mkIf config.btopModule.enable {
		programs.btop = {
      enable = true;
    };
	};
}
