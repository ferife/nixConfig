{ config, lib, pkgs, ... }:
{
	options = {
		batModule.enable = lib.mkEnableOption "Installs & configures bat, a cat clone with syntax highlighting and Git integration";
	};

	config = lib.mkIf config.batModule.enable {
		programs.bat = {
      enable = true;
    };
    home.shellAliases = {
      cat = "bat";
    };
	};
}
