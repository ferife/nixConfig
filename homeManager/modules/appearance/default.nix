{ lib, userSettings, ... }:
{
  imports = [
    ./stylix.nix
  ];

  stylix.hm = {
    enable = lib.mkDefault true;
    theme = userSettings.colorscheme;
  };
}
