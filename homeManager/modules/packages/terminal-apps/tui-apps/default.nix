{ config, lib, pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./dust.nix
    ./lazygit.nix
    ./nixvim.nix
    ./ranger.nix
    ./tmux.nix
  ];

  btopModule.enable    = lib.mkDefault true;
  dustModule.enable    = lib.mkDefault true;
  lazygitModule.enable = lib.mkDefault true;
  nixvimModule.enable  = lib.mkDefault true;
  rangerModule.enable  = lib.mkDefault true;
  tmuxModule.enable    = lib.mkDefault true;
}
