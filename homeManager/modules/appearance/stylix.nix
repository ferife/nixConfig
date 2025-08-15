{
  config,
  lib,
  pkgs,
  ...
}: {
  config = with lib;
    mkIf config.hm.stylix.enable {
      stylix = lib.mkMerge [
        # General Settings
        {
          enable = true;
          autoEnable = true;
          # fonts = {
          #   monospace = {
          #     package = pkgs.nerd-fonts.fira-code;
          #     name = "Fira Code Nerdfont";
          #   };
          # };
          # fonts = {
          #   sansSerif = {
          #     package = pkgs.fira;
          #     name = "Fira Sans";
          #   };
          #   serif = config.stylix.fonts.sansSerif;
          #   monospace = {
          #     package = pkgs.nerd-fonts.fira-code;
          #     name = "Fira Code";
          #   };
          #   emoji = {
          #     package = pkgs.noto-fonts-monochrome-emoji;
          #     name = "Noto Emoji";
          #   };
          # };
        }

        # Onedark
        (mkIf (config.hm.stylix.theme == "onedark") {
          image = ../../../generalResources/background-images/onedark/od_nixos_logo.png;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
          polarity = "dark";
        })
      ];
    };
}
