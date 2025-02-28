{ config, lib, pkgs, ... }:
{
	options = {
	  zsh.hm.enable = lib.mkEnableOption "Z shell, an extended version of bash with new features and support for plugins and themes";
	};

	config = lib.mkIf config.zsh.hm.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;
    };
	};
}
