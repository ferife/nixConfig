

{ config, lib, pkgs, ... }:
{
  imports = [
    ./packages/module-bundle.nix
    ./settings/module-bundle.nix
  ];
}