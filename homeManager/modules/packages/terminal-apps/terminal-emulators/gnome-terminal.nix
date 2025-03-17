{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.gnomeTerminal {
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
