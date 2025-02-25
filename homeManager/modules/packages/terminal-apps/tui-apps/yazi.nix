{ config, lib, pkgs, ... }:
{
	options = {
		yaziModule.enable = lib.mkEnableOption "Installs & configures yazi, a file manager";
	};

	config = lib.mkIf config.yaziModule.enable {
		programs.yazi = {
      enable = true;
      settings = {
        manager.show_hidden = true;
      };
    };
	};
}
