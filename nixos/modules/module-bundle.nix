

{ config, lib, pkgs, ... }:
{
  imports = [
    ./appearance/module-bundle.nix
    ./packages/module-bundle.nix
    ./settings/module-bundle.nix
  ];
}
