{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.vsCode {
		programs.vscode = {
			enable = true;
		};

		home.packages = with pkgs; [ libgcc gnumake ];
	};
}
