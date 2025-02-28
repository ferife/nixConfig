{ config, lib, pkgs, ... }:
{
	options = {
		zsh.nixos.enable = lib.mkEnableOption "Configures zsh at a system-wide level";
	};

	config = lib.mkIf config.zsh.nixos.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
	};
}
