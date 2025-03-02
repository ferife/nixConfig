{ config, lib, pkgs, ... }:
{
	options = {
		vsCode.enable = lib.mkEnableOption "Installs & configures VS Code";
	};

  # Once I move this to Home Manager, I will be able to use programs.vscode.enable

	config = lib.mkIf config.vsCode.enable {
		programs.vscode = {
			enable = true;
		};

		home.packages = with pkgs; [ libgcc gnumake ];
	};
}
