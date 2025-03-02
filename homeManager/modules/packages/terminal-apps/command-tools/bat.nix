{ config, lib, pkgs, ... }:
{
	options = {
		bat.enable = lib.mkEnableOption "Installs & configures bat, a cat clone with syntax highlighting and Git integration";
	};

	config = lib.mkIf config.bat.enable {
		programs.bat = {
      enable = true;
    };
    home.shellAliases = {
      cat = "bat";
    };
	};
}
