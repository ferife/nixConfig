

{ config, lib, pkgs, ... }:
{
  imports = [
    ./desktop-environments/module-bundle.nix
    ./packages/module-bundle.nix
  ];



}