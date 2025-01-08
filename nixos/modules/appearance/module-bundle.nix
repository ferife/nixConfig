{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./stylix.nix
    ];

  stylixNixOSModule.enable = lib.mkDefault true;
}
