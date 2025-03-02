{ config, lib, pkgs, ... }:
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
      flake = "/home/fernandorf/Documents/Configs/nixConfig";

			clean = lib.mkIf config.nh.autoClean {
				enable = true;
				dates = "weekly";
				extraArgs = "-- ask --keep 10";
			};
    };

    environment.shellAliases = lib.mkIf config.nh.shellAliases {
      gash = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        git add . &&
        nh home switch --backup-extension backup --ask --configuration fernandorf@laptop &&
        cd -
      '';
      gashu = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        sudo nix flake update &&
        git add . &&
        nh home switch --backup-extension backup --ask --configuration fernandorf@laptop &&
        cd -
      '';

      gaso = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        git add . &&
        nh os switch --ask --hostname laptop &&
        cd -
      '';
      gasuo = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        sudo nix flake update &&
        git add . &&
        nh os switch --ask --hostname laptop &&
        cd -
      '';

      gasho = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        git add . &&
        nh home switch --backup-extension backup --configuration fernandorf@laptop &&
        nh os switch --ask --hostname laptop &&
        cd -
      '';
      gashuo = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        sudo nix flake update &&
        git add . &&
        nh home switch --backup-extension backup --configuration fernandorf@laptop &&
        nh os switch --ask --hostname laptop &&
        cd -
      '';
      gashuoc = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        sudo nix flake update &&
        git add . &&
        nh home switch --backup-extension backup --configuration fernandorf@laptop &&
        nh os switch --ask --hostname laptop &&
        nh clean all -ak 10 &&
        cd -
      '';
      gashuos = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        sudo nix flake update &&
        git add . &&
        nh home switch --dry --configuration fernandorf@laptop &&
        nh os switch --dry --Hostname laptop &&
        cd -
      '';

      nhc = ''
        cd /home/fernandorf/Documents/Configs/nixConfig/ &&
        nh clean all -ak 10 &&
        cd -
      '';
    };
	};
}
# NOTE: In order to ensure that changes here get applied, reboot after rebuilding
# TODO: Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false
