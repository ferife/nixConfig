{ config, lib, pkgs, ... }:
{
	options = {
		gitModule.enable = lib.mkEnableOption "Installs & configures Git";
	};

	# When I move this to Home Manager, I'll have more options available, such as declaring the user's name and email

	config = lib.mkIf config.gitModule.enable {
		programs.git = {
      enable = true;
    };
	};
}