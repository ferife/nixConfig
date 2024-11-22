{ config, lib, pkgs, ... }:
{
	options = {
		neovimModule.enable = lib.mkEnableOption "Installs & configures Neovim";
	};

	config = lib.mkIf config.neovimModule.enable {
		programs.neovim = {
      enable = true;
    };
		
		home.packages = [ pkgs.libgcc ];
	};
}