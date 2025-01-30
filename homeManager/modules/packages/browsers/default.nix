

{ config, lib, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./tor-browser.nix
  ];

  firefoxModule.enable = lib.mkDefault true;
  torBrowserModule.enable = lib.mkDefault true;
}