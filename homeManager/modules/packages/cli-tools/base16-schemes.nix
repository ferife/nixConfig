{ config, lib, pkgs, ... }:
{
	options = {
		base16SchemesModule.enable = lib.mkEnableOption "Installs all base16 color schemes";
	};

	config = lib.mkIf config.base16SchemesModule.enable {
    home.packages = with pkgs; [
      base16-schemes
    ];
	};
}
