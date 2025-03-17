{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.tldr {
    home.packages = with pkgs; [
      tldr
    ];
	};
}
