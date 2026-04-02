{inputs, ...}: {
  flake.modules.nixos.stylix = {pkgs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    stylix = {
      enable = true;
      autoEnable = true;
      image = ./wallpapers/od_nvim.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
    };
  };

  flake.modules.homeManager.stylix = {pkgs, ...}: {
    stylix = {
      enable = true;
      autoEnable = true;
      image = ./wallpapers/od_nvim.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
    };
  };
}
