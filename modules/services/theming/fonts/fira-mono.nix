{inputs, ...}: {
  # These modules will set the colorscheme to onedark

  flake.modules.nixos.font-fira-mono = {
    config,
    pkgs,
    ...
  }: {
    stylix.fonts = {
      sansSerif = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font";
      };
      serif = config.stylix.fonts.sansSerif;
      monospace = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };
    };
  };

  flake.modules.homeManager.font-fira-mono = {
    config,
    pkgs,
    ...
  }: {
    stylix.fonts = {
      sansSerif = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font";
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
