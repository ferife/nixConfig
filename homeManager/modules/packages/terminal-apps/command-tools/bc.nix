{ config, lib, pkgs, ... }:
{
	options = {
		bcModule.enable = lib.mkEnableOption "Installs & configures bc, a basic CLI math calculator. This should be useful when writing bash scripts";
	};

	config = lib.mkIf config.bcModule.enable {
    home.packages = with pkgs; [
      bc
    ];
	};
}
