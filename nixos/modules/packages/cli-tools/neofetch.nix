{ config, lib, pkgs, ... }:
{
	options = {
		neofetchModule.enable = lib.mkEnableOption "Installs & configures Neofetch";
	};

	config = lib.mkIf config.neofetchModule.enable {
		environment.systemPackages = with pkgs; [
      neofetch
    ];
	};
}