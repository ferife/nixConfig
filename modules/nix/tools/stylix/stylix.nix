{inputs, ...}: {
  flake-file.inputs.stylix = {
    url = "github:nix-community/stylix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

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

  flake.modules.homeManager.stylix = {
    config,
    pkgs,
    ...
  }: {
    gtk.gtk4.theme = config.gtk.theme; # To get rid of evaluation warning

    stylix = {
      enable = true;
      autoEnable = true;
      image = ./wallpapers/od_nvim.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
    };
  };
}
