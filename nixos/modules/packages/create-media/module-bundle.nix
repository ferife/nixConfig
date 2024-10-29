

{ config, lib, pkgs, ... }:
{
  imports = [
    ./gimp.nix
    ./libreoffice.nix
    ./obs-studio.nix
    ./obsidian.nix
  ];
  
  gimpModule.enable = lib.mkDefault true;
  libreofficeModule.enable = lib.mkDefault true;
  obsStudioModule.enable = lib.mkDefault true;
  obsidianModule.enable = lib.mkDefault true;
  
}