

{ config, lib, pkgs, ... }:
{
  imports = [
    ./access-media/module-bundle.nix
    ./cli-tools/module-bundle.nix
    ./nix-related/module-bundle.nix
    ./other/module-bundle.nix
  ];
}