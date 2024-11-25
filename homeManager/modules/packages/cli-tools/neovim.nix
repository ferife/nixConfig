{ config, lib, pkgs, ... }:
{
	options = {
		neovimModule.enable = lib.mkEnableOption "Installs & configures Neovim";
	};

	config = lib.mkIf config.neovimModule.enable {
		programs.neovim = {
      enable = true;

			# The lines below make it so that if a program tries using the programs below, they use NeoVim instead
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
    };
		
		home.packages = with pkgs; [ libgcc gnumake ];
	};
}