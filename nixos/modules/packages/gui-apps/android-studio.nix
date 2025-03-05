{ config, lib, pkgs-unstable, ... }:
{
	options = {
		androidStudio.enable = lib.mkEnableOption "Android Studio, an IDE designed by Google specifically to create Android applications";
	};

	config = lib.mkIf config.androidStudio.enable {
		environment.systemPackages = with pkgs-unstable; [
      android-studio
    ];
    nixpkgs.config.android_sdk.accept_license = true;
    users.users.fernandorf.extraGroups = [ "kvm" ];
	};
}
