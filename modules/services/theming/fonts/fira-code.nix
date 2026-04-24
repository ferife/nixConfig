{inputs, ...}: {
  # These modules will set the colorscheme to onedark

  flake.modules.nixos.font-fira-code = {
    config,
    pkgs,
    ...
  }: {
    stylix.fonts = {
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      serif = config.stylix.fonts.sansSerif;
      monospace = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };
    };
  };

  flake.modules.homeManager.font-fira-code = {
    config,
    pkgs,
    ...
  }: {
    stylix.fonts = {
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      serif = config.stylix.fonts.sansSerif;
      monospace = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };
    };
  };
}
