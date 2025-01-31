{ config, lib, pkgs, ... }:
{
	options = {
		thunderbirdModule.enable = lib.mkEnableOption "Installs & configures Thunderbird";
	};

	config = lib.mkIf config.thunderbirdModule.enable {
    # programs.thunderbird = {
    #   enable = true;
    #   profiles.fernandorf.name = "Fernando RF";
    # };
    home.packages = with pkgs; [
      thunderbird
    ];
	};
}
