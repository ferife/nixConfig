{ config, lib, pkgs-unstable, userSettings, ... }:
{
	config = lib.mkIf config.nixos.androidStudio {
		environment.systemPackages = with pkgs-unstable; [
      android-studio
    ];
    nixpkgs.config.android_sdk.accept_license = true;
    users.users.${userSettings.username}.extraGroups = [ "kvm" ];
	};
}
