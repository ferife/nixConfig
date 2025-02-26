{ config, lib, pkgs, ... }:

{

  stylix.nixos = {
    enable = lib.mkDefault true;
    theme = "onedark";
  };
}
