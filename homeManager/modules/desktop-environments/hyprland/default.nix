{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./settings
  ];
}
