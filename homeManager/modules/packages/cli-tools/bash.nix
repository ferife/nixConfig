{ config, lib, pkgs, ... }:
{
	options = {
		bashModule.enable = lib.mkEnableOption "Installs & configures bash, the GNU Bourne-Again SHell";
	};

	config = lib.mkIf config.bashModule.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
	};
}
