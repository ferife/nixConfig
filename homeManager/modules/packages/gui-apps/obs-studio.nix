{ config, lib, pkgs, ... }:
{
	options = {
		obsStudio.enable = lib.mkEnableOption "Installs & configures OBS Studio";
	};

	config = lib.mkIf config.obsStudio.enable {
		home.packages = with pkgs; [
      obs-studio
    ];
	};
}
# TODO: Switch to programs.obs-studio.enable
