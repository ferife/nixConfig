{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./gaming/module-bundle.nix
  ];

  gaming.enable = lib.mkDefault true;
}