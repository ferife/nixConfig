{ config, lib, pkgs, ... }:
{
	options = {
		nhModule.enable = lib.mkEnableOption "Installs & configures nh, a tool for simplifying the management of NixOS configs";
	};

	config = lib.mkIf config.nhModule.enable {
		programs.nh = {
      enable = true;
      flake = "/home/fernandorf/Documents/nixConfig";
    };
	};
}

# In order to ensure that changes here get applied, reboot after rebuilding