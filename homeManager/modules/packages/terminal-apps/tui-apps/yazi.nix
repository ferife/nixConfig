{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.yazi {
		programs.yazi = {
      enable = true;
      settings = {
        manager.show_hidden = true;
      };
    };
	};
}
