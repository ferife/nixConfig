{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.obsStudio {
		home.packages = with pkgs; [
      obs-studio
    ];
	};
}
# TODO: Switch to programs.obs-studio.enable
