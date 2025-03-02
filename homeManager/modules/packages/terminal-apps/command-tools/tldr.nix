{ config, lib, pkgs, ... }:
{
	options = {
		tldr.enable = lib.mkEnableOption "Installs & configures tldr, a set of simplified and community-driven man pages";
	};

	config = lib.mkIf config.tldr.enable {
    home.packages = with pkgs; [
      tldr
    ];
	};
}
