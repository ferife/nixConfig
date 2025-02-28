{ config, lib, ... }:
{
  imports = [
    ./stylix.nix
  ];

  stylix.nixos = {
    enable = lib.mkDefault true;
    theme = "onedark";
  };
}
