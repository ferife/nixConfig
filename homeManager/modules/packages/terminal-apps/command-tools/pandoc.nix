{ config, lib, pkgs, ... }:
{
	options = {
		pandocModule.enable = lib.mkEnableOption "Installs & configures pandoc, a CLI tool used to convert documents from one file type to another";
	};

	config = lib.mkIf config.pandocModule.enable {
    programs.texlive = {  # texlive packages are a pandoc dependency
      enable = true;
      
    };
		programs.pandoc = {
      enable = true;
    };
	};
}
