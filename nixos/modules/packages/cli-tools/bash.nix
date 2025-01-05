{ config, lib, pkgs, ... }:
{
	options = {
		bashNixosModule.enable = lib.mkEnableOption "Configures bash at a system-wide level";
	};

	config = lib.mkIf config.bashNixosModule.enable {
    programs.bash = {
      completion.enable = true;
      enableLsColors = true;
    };
	};
}
