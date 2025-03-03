{ config, lib, pkgs, ... }:
{
	options = {
		starship.enable = lib.mkEnableOption "starship, a cross-shell prompt with a lot of customizability";
	};

	config = lib.mkIf config.starship.enable {
    programs.starship = lib.mkMerge [
      {
        enable = true;
        # settings =
      }

      (lib.mkIf config.bash.hm.enable {
        enableBashIntegration = true;
      })

      (lib.mkIf config.zsh.hm.enable {
        enableZshIntegration = true;
      })
    ];
	};
}
