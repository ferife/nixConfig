{ config, lib, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./zsh.nix
  ];

  bash.hm.enable = lib.mkDefault true;
  # zsh.hm.enable  = lib.mkDefault true;
}
