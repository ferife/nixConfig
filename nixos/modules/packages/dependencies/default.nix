{ lib, ... }:
{
  imports = [
    ./home-manager.nix
  ];

  homeManager.enable = lib.mkDefault true;
}
