{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./gaming/module-bundle.nix
    ./vlc.nix
];

  gaming.enable = lib.mkDefault true;
  vlcModule = {
    enable = true;
    replaceGnomeDefault = false;
  };
}
