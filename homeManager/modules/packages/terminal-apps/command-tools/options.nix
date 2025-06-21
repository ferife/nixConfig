{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    bat = mkEnableOption "bat, a cat clone with syntax highlighting and Git integration";
    bc = mkEnableOption "bc, a basic CLI math calculator that is often used when writing shell scripts";
    cmatrix = mkEnableOption "cmatrix, a tool that just displays falling text like the Matrix";
    eza = mkEnableOption "eza, an improved version of the ls command with added features";
    fastfetch = mkEnableOption "fastfetch, a CLI system information tool that exists as an improved alternative to neofetch";
    fd = mkEnableOption "fd, an improved version of the find command with added features";
    fzf = mkEnableOption "fzf, a tool for fuzzy searching on the terminal";
    git = mkEnableOption "git, the most widely used version control system";
    lsd = mkEnableOption "lsd, an improved version of the ls command with added features";
    neofetch = mkEnableOption "neofetch, a now-discontinued CLI system information tool";
    pandoc = mkEnableOption "pandoc, a CLI tool used to convert documents from one file type to another";
    pass = mkEnableOption "password-store (AKA pass), the official GNU password storing solution";
    starship = mkEnableOption "starship, a cross-shell prompt with a lot of customizability";
    tldr = mkEnableOption "tldr, a set of simplified and community-driven man pages";
    yt-dlp = mkEnableOption "yt-dlp, a terminal tool used to download videos from YouTube and similar websites";
    zellij = mkEnableOption "zellij, a terminal multiplexer";
    zoxide = mkEnableOption "zoxide, an improved version of the cd command with added features";
  };
}
