{ config, lib, pkgs, ... }:

{
  options = {
    lazygitModule.enable = lib.mkEnableOption "Installs & configures LazyGit, a terminal UI for managing Git Repos";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
