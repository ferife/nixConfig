{ config, lib, pkgs, ... }:
{
	options = {
		tldrModule.enable = lib.mkEnableOption "Installs & configures tldr, a set of simplified and community-driven man pages";
	};

	config = lib.mkIf config.tldrModule.enable {
    home.packages = with pkgs; [
      tldr
    ];
	};
}
