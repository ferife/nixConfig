{
  lib,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./cursor.nix
    ./stylix.nix
  ];

  hm.stylix = {
    enable = lib.mkDefault true;
    theme = userSettings.colorscheme;
  };
}
