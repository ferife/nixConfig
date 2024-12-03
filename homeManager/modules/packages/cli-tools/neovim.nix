{ config, lib, pkgs, inputs, ... }:
{
	options = {
		neovimModule.enable = lib.mkEnableOption "Installs & configures Neovim";
	};
	config = lib.mkIf config.neovimModule.enable {

		xdg.configFile."nvim".source = ./nvim;

		programs.neovim = {
			enable = true;

			# The lines below make it so that if a program tries using the programs below, they use NeoVim instead
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;

			defaultEditor = true;

			extraPackages = with pkgs; [
				gnumake
				ripgrep
				unzip
				xclip
				# nerdfonts
			];

			# There's a couple of packages that needed to be installed system-wide for this to work. They are getting installed in nixos/modules/packages/module-bundle.nix
		};
	};
}

# TODO: Modularize init.lua
# TODO: Add LSPs and configure for the following programming languages (organized by priority)
	# Java
	# Nix
	# C
	# JS (for Obsidian stuff)