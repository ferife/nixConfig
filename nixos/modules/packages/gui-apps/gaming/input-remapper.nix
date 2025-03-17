{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.nixos.gaming.inputRemapper {
		services.input-remapper = {
      enable = true;
    };
	};
}
