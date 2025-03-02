{ config, lib, pkgs, ... }:
{
	options = {
		gnomeTerminal.enable = lib.mkEnableOption "Installs & configures the GNOME terminal";
	};

	config = lib.mkIf config.gnomeTerminal.enable {
		programs.gnome-terminal = {
      showMenubar = true;

      profile.frfConfig = {
        default = true;
        visibleName = "Fernando's Terminal config";

        showScrollbar = false;
        font = "FiraCode Nerd Font 12";

        colors.backgroundColor = "blue";
      };
    };
	};
}
