{ config, lib, pkgs, ... }:
{
	options = {
		fzf.enable = lib.mkEnableOption "Installs & configures fzf, a tool for fuzzy searching on the terminal";
	};

  # To search through command history in the terminal using fzf, simply use CTRL+R

	config = lib.mkIf config.fzf.enable {
		programs.fzf = {
      enable = true;
    };
	};
}
