{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    btop = mkEnableOption "btop, a detailed TUI resource monitor";
    dust = mkEnableOption "dust, a TUI disk space visualizing tool";
    lazygit = mkEnableOption "LazyGit, a terminal UI for managing Git Repos";
    nixvim = mkEnableOption "my nixvim configuration, found at github:ferife/nvimConfig";
    ranger = mkEnableOption "ranger, a terminal-based filesystem manager";
    tmux = mkEnableOption "tmux, a terminal multiplexer";
    yazi = mkEnableOption "yazi, a terminal-based filesystem manager";
  };
}
