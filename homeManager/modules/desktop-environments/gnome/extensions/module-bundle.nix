

{ config, lib, pkgs, ... }:
{
  imports = [
    ./default/module-bundle.nix
    ./third-party/module-bundle.nix
  ];


}