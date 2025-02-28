{ config, lib, pkgs, ... }:
{
	options = {
    stylix.nixos = {
      enable = lib.mkEnableOption "Uses Stylix to rice my system, AKA configure the appearance of it";
      theme = lib.mkOption {
        type = with lib.types; uniq str;
        description = "Select a theme from the available options (currently only onedark)";
        default = "onedark";
        example = "onedark";
      };
    };
	};

	config = lib.mkIf config.stylix.nixos.enable {
    stylix = lib.mkMerge [

      # General Settings
      {
        enable = true;
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
      }

      # Onedark
      (lib.mkIf (config.stylix.nixos.theme == "onedark") {
        image = ../../../generalResources/background-images/onedark/od_nixos_logo.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
        polarity = "dark";
      })
    ];
  };
}
