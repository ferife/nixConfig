{ config, lib, pkgs, ... }:
{
	options = {
		vlcModule.enable = lib.mkEnableOption "Installs & configures VLC GLOBALLY";
    vlcModule.replaceGnomeDefault = lib.mkEnableOption "Replaces Gnome Music and Totem, the default GNOME audio and video players respectively";
	};

	config = lib.mkIf config.vlcModule.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
    environment.gnome = lib.mkIf config.vlcModule.replaceGnomeDefault {
      excludePackages = with pkgs; [
        gnome-music # Audio Player
        totem       # Video Player
      ];
    };
	};
}
