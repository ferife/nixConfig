{ lib, ... }:
{
  imports = [
    ./options.nix

    ./home-manager.nix
  ];

  nixos.homeManager = lib.mkDefault true;
}
