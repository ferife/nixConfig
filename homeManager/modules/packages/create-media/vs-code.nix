{ config, lib, pkgs, ... }:
{
	options = {
		vsCodeModule.enable = lib.mkEnableOption "Installs & configures VS Code";
	};

  # Once I move this to Home Manager, I will be able to use programs.vscode.enable

	config = lib.mkIf config.vsCodeModule.enable {
		programs.vscode = {
			enable = true;
		};

		home.packages = [ pkgs.libgcc ];
		
	};
}