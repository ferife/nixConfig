

{ config, lib, pkgs, ... }:
{
  imports = [
    ./appearance
    ./packages
    ./settings
  ];
}
