{ config, lib, pkgs, ... }:
{
  imports = [
    ./access-media
    ./cli-tools
    ./nix-related
    ./other
  ];
}
