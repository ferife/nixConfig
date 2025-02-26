{ config, lib, pkgs, ... }:
{
	options = with lib; {
    stylix.nixos = {
      enable = mkEnableOption "Uses Stylix to rice my system, AKA configure the appearance of it";
      theme = mkOption {
        type = with types; uniq str;
        description = "Select a theme from the available options (currently only onedark)";
        default = "onedark";
        example = "onedark";
      };
    };
	};

	config = with lib; mkIf config.stylix.nixos.enable {
    stylix = mkMerge [

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
      (mkIf (config.stylix.nixos.theme == "onedark") {
        image = ../../../generalResources/background-images/onedark/od_nixos_logo.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
        polarity = "dark";
      })
    ];
  };
}
