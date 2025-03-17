{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.gimp {
		home.packages = with pkgs; [
      gimp
    ];
	};
}
