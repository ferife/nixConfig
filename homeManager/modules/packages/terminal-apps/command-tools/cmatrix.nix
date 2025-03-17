{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.cmatrix {
    home.packages = with pkgs; [
      cmatrix
    ];
    home.shellAliases = {
      "matrix" = "cmatrix -a -C blue -u 3";
    };
	};
}
