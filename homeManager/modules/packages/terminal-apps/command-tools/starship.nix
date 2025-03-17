{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.starship {
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

      (lib.mkIf config.hm.bash {
        enableBashIntegration = true;
      })

      (lib.mkIf config.hm.zsh {
        enableZshIntegration = true;
      })
    ];
	};
}
