{ config, lib, pkgs, userSettings, ... }:
{
	config = lib.mkIf config.nixos.gnome.gdmSettings {
		environment.systemPackages = with pkgs; [
      gdm-settings
    ];
	};
}
