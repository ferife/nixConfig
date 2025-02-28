{ config, lib, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./zsh.nix
  ];

  bash.nixos.enable = lib.mkDefault true;
  # zsh.nixos.enable  = lib.mkDefault true;
}
