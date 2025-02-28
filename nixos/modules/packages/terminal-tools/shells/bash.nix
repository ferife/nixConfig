{ config, lib, pkgs, ... }:
{
	options = {
		bash.nixos.enable = lib.mkEnableOption "Configures bash at a system-wide level";
	};

	config = lib.mkIf config.bash.nixos.enable {
    programs.bash = {
      completion.enable = true;
      enableLsColors = true;
    };
	};
}
