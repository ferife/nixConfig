

{ config, lib, pkgs, ... }:
{
  imports = [
    ./access-media/module-bundle.nix
    ./browsers/module-bundle.nix
    ./cli-tools/module-bundle.nix
    ./create-media/module-bundle.nix
    ./other/module-bundle.nix
  ];


}