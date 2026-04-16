{inputs, ...}: {
  flake.modules.homeManager.nixvim-textobjects = {pkgs, ...}: {
    plugins.mini-ai = {
      enable = true;

      # Alternative to nvim-treesitter-textobject and nvim-surround
      mappings = {
        # Main textobject prefixes
        around = "a";
        inside = "i";

        # Next/last variants
        around_next = "an";
        inside_next = "in";
        around_last = "al";
        inside_last = "il";

        # Move cursor to corresponding edge of `a` textobject
        goto_left = "g[";
        goto_right = "g]";
      };

      # Number of lines within which textobject is searched
      n_line = 500;

      # How to search for object
      # first inside current line, then inside neighborhood
      search_method = "cover_or_next";

      # Whether to disable showing non-error feedback
      silent = false;
    };
  };
}
