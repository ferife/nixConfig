{inputs, ...}: {
  flake.modules.homeManager.nixvim-git = {pkgs, ...}: {
    plugins = {
      gitsigns = {
        enable = true;

        settings = {
          current_line_blame = false;
          current_line_blame_opts = {
            virt_text = true;
            virt_text_pos = "eol";
          };
          signcolumn = true;
          signs = {
            add.text = "│";
            change.text = "│";
            changedelete.text = "~";
            delete.text = "_";
            topdelete.text = "‾";
            untracked.text = "┆";
          };
          # signs = {
          #   delete.show_count = true;
          #   add.text = "a";
          #   change.text = "c";
          #   delete.text = "d";
          #   untracked = "u";
          # };
          # signs_staged = {
          #   add.text = "A";
          #   change.text = "C";
          #   delete.text = "D";
          #   untracked = "U";
          # };
          trouble = true;
          watch_gitdir.follow_files = true;
        };
      };

      snacks = {
        enable = true;
        settings.lazygit.enable = true; # Open lazygit in a floating window
      };

      trouble.enable = true;
    };

    keymaps = [
      {
        action = "<cmd>lua Snacks.lazygit()<CR>";
        key = "<leader>lg";
        mode = "n";
        options.desc = "Open lazygit";
      }
    ];
  };
}
