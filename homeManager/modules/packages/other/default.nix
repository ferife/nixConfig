

{ config, lib, pkgs, ... }:
{
  imports = [
    ./thunderbird.nix
  ];

  thunderbirdModule.enable = lib.mkDefault true;
}