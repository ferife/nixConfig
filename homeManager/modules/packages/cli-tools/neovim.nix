{ config, lib, pkgs, inputs, ... }:
{
	options = {
		neovimModule.enable = lib.mkEnableOption "Installs & configures Neovim";
	};
	config = lib.mkIf config.neovimModule.enable {

		nixpkgs = {
			overlays = [
				(final: prev: {
					vimPlugins = prev.vimPlugins // {
						neovim-config = prev.vimUtils.buildVimPlugin {
							name = "nvimConfig";
							src = inputs.frf-neovim-config;
						};
					};
				})
			];
		};

		programs.neovim = {
			enable = true;

			# The lines below make it so that if a program tries using the programs below, they use NeoVim instead
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;

			defaultEditor = true;

			extraPackages = with pkgs; [
				libgcc
				gnumake
				ripgrep
				unzip
				xclip
				# nerdfonts
			];

			plugins = with pkgs.vimPlugins; [
				neovim-config
			];
		};
	};
}