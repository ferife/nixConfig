{ config, lib, pkgs, ... }:
{
	options = {
		gimpModule.enable = lib.mkEnableOption "Installs & configures Gimp";
	};

	config = lib.mkIf config.gimpModule.enable {
		environment.systemPackages = with pkgs; [
      gimp
    ];
	};
}