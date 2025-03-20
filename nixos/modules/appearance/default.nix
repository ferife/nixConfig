{
  config,
  lib,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./stylix.nix
  ];

  nixos.stylix = {
    enable = lib.mkDefault true;
    theme = userSettings.colorscheme;
  };
}
