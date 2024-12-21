{ config, lib, pkgs, ... }:
{
	options = {
		gnomeTerminalModule.enable = lib.mkEnableOption "Installs & configures tmux";
	};

	config = lib.mkIf config.gnomeTerminalModule.enable {
		programs.gnome-terminal = {
      showMenubar = true;
    };
	};
}
