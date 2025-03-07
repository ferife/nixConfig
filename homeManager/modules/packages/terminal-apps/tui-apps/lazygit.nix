{ config, lib, pkgs, ... }:
{
  options = {
    lazygit.enable = lib.mkEnableOption "Installs & configures LazyGit, a terminal UI for managing Git Repos";
  };

  config = lib.mkIf config.lazygit.enable {
    programs.lazygit = {
      enable = true;
    };
    home.shellAliases = {
      "lg" = "lazygit";
      "lazy" = "lazygit";
    };
  };
}
# NOTE: To undo commits in lazygit and put their changes back in the working tree, do the following:
# Go to the commits window and put the cursor on the commit that will be the new head
# Press "g" (git reset) and select the "mixed" option
