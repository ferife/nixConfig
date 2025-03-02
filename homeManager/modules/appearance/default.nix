{ lib, ... }:
{
  imports = [
    ./stylix.nix
  ];

  stylix.hm = {
    enable = lib.mkDefault true;
    theme = "onedark";
  };
}
