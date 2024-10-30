{ config, lib, pkgs, ... }:
{
	options = {
		vsCodeModule.enable = lib.mkEnableOption "Installs & configures VS Code";
	};

  # Once I move this to Home Manager, I will be able to use programs.vs-code.enable

	config = lib.mkIf config.vsCodeModule.enable {
		environment.systemPackages = with pkgs; [
      vscode
    ];
		
		libgccModule.enable = lib.mkForce true;
	};
}