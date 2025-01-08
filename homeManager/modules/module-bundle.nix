

{ config, lib, pkgs, ... }:
{
  imports = [
    ./appearance/module-bundle.nix
    ./desktop-environments/module-bundle.nix
    ./packages/module-bundle.nix
  ];
}
