{ config, lib, pkgs, ... }:
{
	options = {
		cmatrix.enable = lib.mkEnableOption "cmatrix, a tool that just displays falling text like the Matrix";
	};

	config = lib.mkIf config.cmatrix.enable {
    home.packages = with pkgs; [
      cmatrix
    ];
    home.shellAliases = {
      matrix = "cmatrix -aC blue";
    };
	};
}
