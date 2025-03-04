{ config, lib, userSettings, ... }:
{
  imports = [
    ./stylix.nix
  ];

  stylix.nixos = {
    enable = lib.mkDefault true;
    theme = userSettings.colorscheme;
  };
}
