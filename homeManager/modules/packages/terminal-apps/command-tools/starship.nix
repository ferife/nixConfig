{ config, lib, pkgs, ... }:
{
	options = {
		starship.enable = lib.mkEnableOption "starship, a cross-shell prompt with a lot of customizability";
	};

	config = lib.mkIf config.starship.enable {
    programs.starship = lib.mkMerge [
      {
        enable = true;
        settings.shell = {
          disabled = false;

          bash_indicator = "bash";
          cmd_indicator = "cmd";
          elvish_indicator = "elvish";
          fish_indicator = "fish";
          ion_indicator = "ion";
          nu_indicator = "nu";
          powershell_indicator = "powershell";
          tcsh_indicator = "tcsh";
          xonsh_indicator = "xonsh";
          zsh_indicator = "zsh";
          unknown_indicator = "unknown";
        };
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
