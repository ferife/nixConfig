{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./stylix.nix
    ];

  stylixHmModule.enable = lib.mkDefault true;
}
