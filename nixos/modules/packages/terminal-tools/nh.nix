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

    environment.shellAliases = lib.mkIf config.nh.shellAliases {
      gash = ''
        cd ${systemSettings.flakePath} &&
        git add . &&
        nh home switch --backup-extension backup --ask --configuration ${userSettings.username}@${systemSettings.hostname1} &&
        cd - &&
        exec '$SHELL'
      '';
      gashu = ''
        cd ${systemSettings.flakePath} &&
        sudo nix flake update &&
        git add . &&
        nh home switch --backup-extension backup --ask --configuration ${userSettings.username}@${systemSettings.hostname1} &&
        cd - &&
        exec '$SHELL'
      '';

      gaso = ''
        cd ${systemSettings.flakePath} &&
        git add . &&
        nh os switch --ask --hostname ${systemSettings.hostname1} &&
        cd - &&
        exec '$SHELL'
      '';
      gasuo = ''
        cd ${systemSettings.flakePath} &&
        sudo nix flake update &&
        git add . &&
        nh os switch --ask --hostname ${systemSettings.hostname1} &&
        cd - &&
        exec '$SHELL'
      '';

      gasho = ''
        cd ${systemSettings.flakePath} &&
        git add . &&
        nh home switch --backup-extension backup --configuration ${userSettings.username}@${systemSettings.hostname1} &&
        nh os switch --ask --hostname ${systemSettings.hostname1} &&
        cd - &&
        exec '$SHELL'
      '';
      gashuo = ''
        cd ${systemSettings.flakePath} &&
        sudo nix flake update &&
        git add . &&
        nh home switch --backup-extension backup --configuration ${userSettings.username}@${systemSettings.hostname1} &&
        nh os switch --ask --hostname ${systemSettings.hostname1} &&
        cd - &&
        exec '$SHELL'
      '';
      gashuoc = ''
        cd ${systemSettings.flakePath} &&
        sudo nix flake update &&
        git add . &&
        nh home switch --backup-extension backup --configuration ${userSettings.username}@${systemSettings.hostname1} &&
        nh os switch --ask --hostname ${systemSettings.hostname1} &&
        nh clean all -ak 10 &&
        cd - &&
        exec '$SHELL'
      '';
      gashuos = ''
        cd ${systemSettings.flakePath} &&
        sudo nix flake update &&
        git add . &&
        nh home switch --dry --configuration ${userSettings.username}@${systemSettings.hostname1} &&
        nh os switch --dry --Hostname ${systemSettings.hostname1} &&
        cd -
      '';

      nhc = ''
        cd ${systemSettings.flakePath} &&
        nh clean all -ak 10 &&
        cd -
      '';
    };
	};
}
# NOTE: In order to ensure that changes here get applied, reboot after rebuilding
# TODO: Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false
