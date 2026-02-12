{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = {
    alejandra = lib.mkEnableOption "alejandra, a Nix code formatter tool";
    bat = lib.mkEnableOption "bat, a cat clone with syntax highlighting and Git integration";
    bc = lib.mkEnableOption "bc, a basic CLI math calculator that is often used when writing shell scripts";
    cmatrix = lib.mkEnableOption "cmatrix, a tool that just displays falling text like the Matrix";
    eza = lib.mkEnableOption "eza, an improved version of the ls command with added features";
    fastfetch = lib.mkEnableOption "fastfetch, a CLI system information tool that exists as an improved alternative to neofetch";
    fd = lib.mkEnableOption "fd, an improved version of the find command with added features";
    fzf = lib.mkEnableOption "fzf, a tool for fuzzy searching on the terminal";
    git = lib.mkEnableOption "git, the most widely used version control system";
    lsd = lib.mkEnableOption "lsd, an improved version of the ls command with added features";
    neofetch = lib.mkEnableOption "neofetch, a now-discontinued CLI system information tool";
    pandoc = lib.mkEnableOption "pandoc, a CLI tool used to convert documents from one file type to another";
    pass = lib.mkEnableOption "password-store (AKA pass), the official GNU password storing solution";
    plantuml = lib.mkEnableOption "plantuml, a tool used to generate diagrams (for things such as Java classes) from text";
    playerctl = lib.mkEnableOption "playerctl, a tool that can control media players from within the CLI";
    starship = lib.mkEnableOption "starship, a cross-shell prompt with a lot of customizability";
    tldr = lib.mkEnableOption "tldr, a set of simplified and community-driven man pages";
    wine = lib.mkEnableOption "wine, a tool used to emulate Windows for the sake of running certain windows-only applications and packages";
    yt-dlp = lib.mkEnableOption "yt-dlp, a terminal tool used to download videos from YouTube and similar websites";
    zellij = lib.mkEnableOption "zellij, a terminal multiplexer";
    zoxide = lib.mkEnableOption "zoxide, an improved version of the cd command with added features";
  };
}
