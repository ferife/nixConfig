{ config, lib, pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./dust.nix
    ./lazygit.nix
    ./nixvim.nix
    ./ranger.nix
    ./tmux.nix
    ./yazi.nix
  ];

  btop.enable    = lib.mkDefault true;
  dust.enable    = lib.mkDefault true;
  lazygit.enable = lib.mkDefault true;
  nixvim.enable  = lib.mkDefault true;
  ranger.enable  = lib.mkDefault false; # Replaced by yazi
  tmux.enable    = lib.mkDefault true;
  yazi.enable    = lib.mkDefault true;
}
