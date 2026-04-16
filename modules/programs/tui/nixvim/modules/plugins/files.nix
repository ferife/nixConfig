{inputs, ...}: {
  flake.modules.homeManager.nixvim-files = {pkgs, ...}: {
    plugins.mini-files = {
      enable = true;
      settings = {
        mappings = {
          close = "q";
          go_in = "l";
          go_in_plus = "L";
          go_out = "h";
          go_out_plus = "H";
          mark_goto = "'";
          mark_set = "m";
          reset = "<BS>";
          reveal_cwd = "@";
          show_help = "g?";
          synchronize = "=";
          trim_left = "<";
          trim_right = ">";
        };
        options = {
          permanent_delete = true;
          use_as_default_explorer = true;
        };
      };
    };
    keymaps = [
      {
        action = "<cmd>lua MiniFiles.open()<CR>";
        key = "<leader>fs";
        mode = "n";
        options.desc = "Open mini.files";
      }
    ];
  };
}
