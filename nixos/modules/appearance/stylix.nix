{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.stylix.enable {
    stylix = lib.mkMerge [
      # General Settings
      {
        enable = true;
        autoEnable = false;
        targets = {
          chromium.enable = true;
          console.enable = true;
          gnome.enable = true;
          grub = {
            enable = true;
            useWallpaper = true;
          };
          kmscon.enable = true;
          lightdm.enable = true;
          nixos-icons.enable = true;
          plymouth.enable = true;
          regreet.enable = true;
        };
      }

      # Onedark
      (lib.mkIf (config.nixos.stylix.theme == "onedark") {
        image = ../../../generalResources/background-images/onedark/od_nixos_logo.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
        polarity = "dark";
      })
    ];
  };
}
