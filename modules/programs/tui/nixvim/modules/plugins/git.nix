{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-git = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-git = {pkgs, ...}: {
    plugins = {
      trouble.enable = true;
      gitsigns = {
        enable = true;
        settings = {
          signs = {
            delete.show_count = true;
            add.text = "a";
            change.text = "c";
            delete.text = "d";
            untracked = "u";
          };
          signs_staged = {
            add.text = "A";
            change.text = "C";
            delete.text = "D";
            untracked = "U";
          };
          trouble = true;
        };
      };
    };
  };
}
