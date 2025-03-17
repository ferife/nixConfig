{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.lsd {
		programs.lsd = {
      enable = true;
      enableAliases = true;
    };
	};
}
