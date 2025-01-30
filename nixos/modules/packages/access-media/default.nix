{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./gaming
    ./vlc.nix
];

  gaming.enable = lib.mkDefault true;
  vlcModule = {
    enable = true;
    replaceGnomeDefault = false;
  };
}
