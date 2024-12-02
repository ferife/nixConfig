{ config, lib, pkgs, ... }:
{
	options = {
		fzfModule.enable = lib.mkEnableOption "Installs & configures fzf";
	};

	config = lib.mkIf config.fzfModule.enable {
		programs.fzf = {
      enable = true;
    };
	};
}