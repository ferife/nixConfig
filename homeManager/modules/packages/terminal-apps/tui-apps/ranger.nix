{ config, lib, pkgs, ... }:
{
	options = {
		ranger.enable = lib.mkEnableOption "Installs & configures ranger";
	};

	config = lib.mkIf config.ranger.enable {
		programs.ranger = {
      enable = true;
    };
	};
}
