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

			defaultEditor = true;
			cu

			# extraConfig = lib.fileContents ./nvim/init.lua;
    };

		nvimConfig = pkgs.vimUtils.buildVimPlugin {
			name = "my-config";
			src = ./nvim
		}

		# home.file."./.config/nvim" = {
		# 	source = ./nvim;
		# 	recursive = true;
		# };

		# environment.variables.EDITOR = "nvim";
		
		home.packages = with pkgs; [ 
			libgcc
			gnumake
			ripgrep
			# nerdfonts
		];
	};
}