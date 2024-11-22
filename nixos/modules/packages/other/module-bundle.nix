

{ config, lib, pkgs, ... }:
{
  imports = [
    ./mullvad-vpn.nix
  ];

  mullvadVpnModule.enable = lib.mkDefault true;
}