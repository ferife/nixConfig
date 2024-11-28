{ config, lib, pkgs, ... }:
{
	options = {
		nhModule.enable = lib.mkEnableOption "Installs & configures nh, a tool for simplifying the management of NixOS configs";
		nhModule.autoClean = lib.mkEnableOption "Allows nh to perform periodic garbage collection with nh clean all";
	};

	config = lib.mkIf config.nhModule.enable {
		programs.nh = {
      enable = true;
      flake = "/home/fernandorf/Documents/Configs/nixConfig";

			clean = lib.mkIf config.nhModule.autoClean {
				enable = true;
				dates = "weekly";
				extraArgs = "-- ask --keep 10";
			};

    };
	};
}

# In order to ensure that changes here get applied, reboot after rebuilding


# Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false