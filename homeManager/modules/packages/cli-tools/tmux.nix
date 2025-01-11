{ config, lib, pkgs, ... }:
{
	options = {
		tmuxModule.enable = lib.mkEnableOption "Installs & configures tmux, a terminal multiplexer";
	};

	config = lib.mkIf config.tmuxModule.enable {
		programs.tmux = {
      enable = true;
      mouse = true;
      keyMode = "vi"; # Enables Vim-style shortcuts
    };
	};
}
