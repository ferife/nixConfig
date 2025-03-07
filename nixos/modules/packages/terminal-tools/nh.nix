{ config, lib, pkgs, systemSettings, userSettings, ... }:
{
	options = {
    nh = {
      enable = lib.mkEnableOption "Installs & configures nh, a tool for simplifying the management of NixOS configs";
      autoClean = lib.mkEnableOption "Allows nh to perform periodic garbage collection with nh clean all";
      shellAliases = lib.mkEnableOption "shell aliases relating to nh";
    };
	};

	config = lib.mkIf config.nh.enable {
		programs.nh = {
      enable = true;
      flake = systemSettings.flakePath;

			clean = lib.mkIf config.nh.autoClean {
				enable = true;
				dates = "weekly";
				extraArgs = "-- ask --keep 10";
			};
    };

    environment.variables = {
      NIX_CONFIG_PATH="${systemSettings.nixConfigPath}";
      FLAKE_HOSTNAME="${systemSettings.hostname1}";
    };

    environment.shellAliases = lib.mkIf config.nh.shellAliases {
      gas = "bash ~/Documents/Scripts/nh-script.bash";
    };
	};
}
# NOTE: In order to ensure that changes here get applied, reboot after rebuilding
# TODO: Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false
