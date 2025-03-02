{ config, lib, pkgs, ... }:
{
	options = {
		bash.hm.enable = lib.mkEnableOption "Installs & configures bash, the GNU Bourne-Again SHell";
	};

	config = lib.mkIf config.bash.hm.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
	};
}
