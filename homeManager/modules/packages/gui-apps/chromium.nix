{ config, lib, ... }:
{
	config = lib.mkIf config.hm.chromium {
    programs.chromium.enable = true;
	};
}
