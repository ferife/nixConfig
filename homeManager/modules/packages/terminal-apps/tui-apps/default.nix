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

  btopModule.enable    = lib.mkDefault true;
  dustModule.enable    = lib.mkDefault true;
  lazygitModule.enable = lib.mkDefault true;
  nixvimModule.enable  = lib.mkDefault true;
  rangerModule.enable  = lib.mkDefault false; # Replaced by yazi
  tmuxModule.enable    = lib.mkDefault true;
  yaziModule.enable    = lib.mkDefault true;
}
