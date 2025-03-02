{ config, lib, pkgs, ... }:
{
	options = {
    vlc = {
      enable = lib.mkEnableOption "Installs & configures VLC GLOBALLY";
      replaceGnomeDefault = lib.mkEnableOption "Replaces Gnome Music and Totem, the default GNOME audio and video players respectively";
    };
	};

	config = lib.mkIf config.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
    environment.gnome = lib.mkIf config.vlc.replaceGnomeDefault {
      excludePackages = with pkgs; [
        gnome-music # Audio Player
        totem       # Video Player
      ];
    };
	};
}
