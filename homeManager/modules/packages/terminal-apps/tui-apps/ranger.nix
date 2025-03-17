{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.ranger {
		programs.ranger = {
      enable = true;
    };
	};
}
