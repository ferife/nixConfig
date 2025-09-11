{
  config,
  lib,
  ...
}: {
  options.nixos = {
    distrobox = lib.mkEnableOption "distrobox, a program used to create containers running other Linux distros";
    fastfetch = lib.mkEnableOption "fastfetch, a system information tool";
    git = lib.mkEnableOption "git, a version-control system";
    kitty = lib.mkEnableOption "kitty, a terminal emulator";
    mullvad = lib.mkEnableOption "the Mullvad VPN CLI";
    neofetch = lib.mkEnableOption "neofetch, a system information tool";
    nh = {
      enable = lib.mkEnableOption "nh, a nix CLI helper";
      autoClean = lib.mkEnableOption "periodic garbage collection with nh clean all";
      shellAliases = lib.mkEnableOption "shell aliases relating to nh";
    };
    nix-tree = lib.mkEnableOption "nix-tree, a program made to browse nix package dependencies";
    nixos-shell = lib.mkEnableOption "nixos-shell, a program made for creating NixOS virtual machines";
  };
}
