

{ config, lib, pkgs, ... }:
{
  imports = [
    ./libgcc.nix
    ./mullvad-vpn.nix
    ./thunderbird.nix
  ];

  libgccModule.enable = lib.mkDefault false;
  mullvadVpnModule.enable = lib.mkDefault true;
  thunderbirdModule.enable = lib.mkDefault true;
}