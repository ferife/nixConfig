{ config, lib, ... }:
{
	options = {
		kitty.enable = lib.mkEnableOption "Installs & configures Kitty, the terminal emulator";
	};

	config = lib.mkIf config.kitty.enable {
    programs.kitty = lib.mkMerge [
      {
        enable = true;
        settings.background_opacity = lib.mkForce 0.9;
      }

      (lib.mkIf config.bash.hm.enable {
        shellIntegration.enableBashIntegration = true;
      })

      (lib.mkIf config.zsh.hm.enable {
        shellIntegration.enableZshIntegration = true;
      })
    ];

	};
}

# To search through command history in the terminal using stylix, simply use CTRL+R
