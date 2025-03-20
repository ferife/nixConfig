{
  lib,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./stylix.nix
  ];

  hm.stylix = {
    enable = lib.mkDefault true;
    theme = userSettings.colorscheme;
  };
}
