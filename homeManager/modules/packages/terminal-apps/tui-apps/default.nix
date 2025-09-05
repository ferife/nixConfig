{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./btop.nix
    ./dust.nix
    ./lazygit.nix
    ./nixvim.nix
    ./procs.nix
    ./ranger.nix
    ./tmux.nix
    ./yazi.nix
  ];

  hm = {
    btop = lib.mkDefault true;
    dust = lib.mkDefault true;
    lazygit = lib.mkDefault true;
    nixvim = lib.mkDefault true;
    procs = lib.mkDefault true;
    # ranger = lib.mkDefault false; # Replaced by yazi
    tmux = lib.mkDefault true;
    yazi = lib.mkDefault true;
  };
}
