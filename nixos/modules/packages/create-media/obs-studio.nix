{ config, lib, pkgs, ... }:
{
	options = {
		obsStudioModule.enable = lib.mkEnableOption "Installs & configures OBS Studio";
	};

# Once I move this to Home Manager, I will be able to use programs.obs-studio.enable

	config = lib.mkIf config.obsStudioModule.enable {
		environment.systemPackages = with pkgs; [
      obs-studio
    ];
	};
}