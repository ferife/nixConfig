{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.lazygit {
    programs.lazygit = {
      enable = true;
      settings = {
        os.editPreset = "nvim";
      };
    };
    home.shellAliases = {
      "lg" = "lazygit";
    };
  };
  # NOTE: To undo commits in lazygit and put their changes back in the working tree, do the following:
  # Go to the commits window and put the cursor on the commit that will be the new head
  # Press "g" (git reset) and select the "mixed" option
}
