{ config, lib, pkgs, ... }:
{
	options = {
		fzfModule.enable = lib.mkEnableOption "Installs & configures fzf, a tool for fuzzy searching on the terminal";
	};

  # To search through command history in the terminal using fzf, simply use CTRL+R

	config = lib.mkIf config.fzfModule.enable {
		programs.fzf = {
      enable = true;
    };
	};
}
