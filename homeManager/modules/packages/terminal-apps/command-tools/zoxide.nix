{ config, lib, pkgs, ... }:
{
	options = {
		zoxide.enable = lib.mkEnableOption "Installs & configures zoxide, the replacement for the cd command";
	};

	config = lib.mkIf config.zoxide.enable {
    programs.zoxide = lib.mkMerge [
      { enable = true; }

      (lib.mkIf config.bash.hm.enable {
        enableBashIntegration = true;
      })

      (lib.mkIf config.zsh.hm.enable {
        enableZshIntegration = true;
      })
    ];
    programs.fzf.enable = true;
	};
}
