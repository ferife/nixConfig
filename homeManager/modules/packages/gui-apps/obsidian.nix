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
