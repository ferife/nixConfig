{inputs, ...}: {
  # These modules will set the colorscheme to onedark

  flake.modules.nixos.color-onedark = {pkgs, ...}: {
    stylix = {
      image = ./wallpapers/onedark/od_nvim.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
    };
  };

  flake.modules.homeManager.color-onedark = {
    lib,
    pkgs,
    ...
  }: {
    stylix = {
      image = ./wallpapers/onedark/od_nvim.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";

      targets.zellij.enable = false;
    };

    programs = {
      nixvim.colorschemes.onedark.enable = true;
      zellij.settings.theme = "onedark";
    };
  };
}
