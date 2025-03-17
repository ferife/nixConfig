{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix
    ./extensions
    ./settings
  ];
}
