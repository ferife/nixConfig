{ config, lib, pkgs, ... }:
{
	options = {
		libgccModule.enable = lib.mkEnableOption "Installs & configures libgcc, a C and C++ compiler";
	};

	config = lib.mkIf config.libgccModule.enable {
		environment.systemPackages = with pkgs; [
      libgcc
    ];
	};
}