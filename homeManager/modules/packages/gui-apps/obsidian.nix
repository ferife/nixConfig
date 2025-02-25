{ config, lib, pkgs, pkgs-unstable, ... }:
{
	options = {
		obsidianModule.enable = lib.mkEnableOption "Installs & configures Obsidian.md";
	};

	config = lib.mkIf config.obsidianModule.enable {
		home.packages = with pkgs-unstable; [
      obsidian
    ];
	};
}
# TODO: Figure out if I can use home manager to manage the configurations of obsidian, or at least put my obsidian configuration into a git repo
