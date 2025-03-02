{ config, lib, pkgs, ... }:
{
	options = {
		yazi.enable = lib.mkEnableOption "Installs & configures yazi, a file manager";
	};

	config = lib.mkIf config.yazi.enable {
		programs.yazi = {
      enable = true;
      settings = {
        manager.show_hidden = true;
      };
    };
	};
}
