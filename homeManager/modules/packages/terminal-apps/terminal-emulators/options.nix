{ config, lib, pkgs, pkgs-unstable, ... }:
{
	options.hm = with lib; {
    kitty = mkEnableOption "Kitty, a terminal emulator that takes advantage of the GPU, can display images, and adds great customization";
    gnomeTerminal  = mkEnableOption "the GNOME terminal emulator, which comes installed by default with the GNOME desktop environment";
	};
}
