{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.hm.dust {
    home.packages = with pkgs; [ dust ];
	};
}
