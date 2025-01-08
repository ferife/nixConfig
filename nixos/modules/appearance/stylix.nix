{ config, lib, pkgs, ... }:
{
	options = {
		stylixNixOSModule.enable = lib.mkEnableOption "Uses Stylix to rice my system, AKA configure the appearance of it";
	};

	config = lib.mkIf config.stylixNixOSModule.enable {

    # environment.systemPackages = with pkgs; [
    #   kitty
    # ];

    stylix = {
      enable = true;
      image = ./background-images/onedark_nixos_logo.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";

      autoEnable = false;
      targets = {
        chromium.enable = true;
        console.enable = true;
        grub = {
          enable = true;
          useImage = true;
        };
        kmscon.enable = true;
        lightdm.enable = true;
        nixos-icons.enable = true;
        plymouth.enable = true;
        regreet.enable = true;
      };
    };
	};
}
