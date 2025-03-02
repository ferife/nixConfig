{ config, lib, pkgs, ... }:
{
	options = {
		tmux.enable = lib.mkEnableOption "Installs & configures tmux, a terminal multiplexer";
	};

	config = lib.mkIf config.tmux.enable {
		programs.tmux = {
      enable = true;
      mouse = true;
      keyMode = "vi"; # Enables Vim-style shortcuts
    };
	};
}
