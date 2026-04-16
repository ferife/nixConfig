{inputs, ...}: {
  flake.modules.homeManager.nixvim-telescope = {pkgs, ...}: {
    plugins.telescope = {
      enable = true;
      settings = {
        defaults.file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        pickers = {
          find_files = {
            theme = "ivy";
            hidden = true;
          };
          live_grep = {
            theme = "dropdown";
            hidden = true;
          };
        };
        extensions = {
          fzy-native.enable = true; # Fast fuzzy search
          # undo = {
          #   enable = true;
          # };
        };
      };
      keymaps = {
        "<leader>fd" = {
          action = "find_files";
          options.desc = "Search for file names in the current working directory";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Search through the neovim help";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Grep search through all text file contents in the current working directory";
        };
      };
    };
    dependencies = {
      fd.enable = true;
      ripgrep.enable = true;
    };
  };
}
