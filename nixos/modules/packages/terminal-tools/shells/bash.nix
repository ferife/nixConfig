{ config, lib, pkgs, ... }:
{
	config = lib.mkIf config.nixos.bash {
    programs.bash = {
      completion.enable = true;
      enableLsColors = true;
    };
	};
}
