{ config, lib, pkgs, ... }:
{
	options = {
		gimp.enable = lib.mkEnableOption "Installs & configures Gimp";
	};

	config = lib.mkIf config.gimp.enable {
		home.packages = with pkgs; [
      gimp
    ];
	};
}
