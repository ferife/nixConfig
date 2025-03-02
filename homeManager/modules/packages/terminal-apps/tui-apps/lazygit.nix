{ config, lib, pkgs, ... }:
{
  options = {
    lazygit.enable = lib.mkEnableOption "Installs & configures LazyGit, a terminal UI for managing Git Repos";
  };

  config = lib.mkIf config.lazygit.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
