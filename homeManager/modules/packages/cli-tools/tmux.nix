{ config, lib, pkgs, ... }:
{
	options = {
		tmuxModule.enable = lib.mkEnableOption "Installs & configures tmux";
	};

	config = lib.mkIf config.tmuxModule.enable {
		programs.tmux = {
      enable = true;
      mouse = true;
      keyMode = "vi"; # Enables Vim-style shortcuts
    };
	};
}