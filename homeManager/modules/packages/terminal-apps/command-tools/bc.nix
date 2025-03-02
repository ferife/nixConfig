{ config, lib, pkgs, ... }:
{
	options = {
		bc.enable = lib.mkEnableOption "Installs & configures bc, a basic CLI math calculator. This should be useful when writing bash scripts";
	};

	config = lib.mkIf config.bc.enable {
    home.packages = with pkgs; [
      bc
    ];
	};
}
