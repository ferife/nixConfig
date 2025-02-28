{ config, lib, pkgs, ... }:
{
	options = {
	  zsh.enable = lib.mkEnableOption "Z shell, an extended version of bash with new features and support for plugins and themes";
	};

	config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
    };
	};
}
