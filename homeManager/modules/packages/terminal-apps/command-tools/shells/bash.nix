{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.bash {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
	};
}
