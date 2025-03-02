{ config, lib, pkgs, ... }:
{
	options = {
		git.nixos.enable = lib.mkEnableOption "Installs & configures Git";
	};

	config = lib.mkIf config.git.nixos.enable {
		programs.git = {
      enable = true;
    };
	};
}
