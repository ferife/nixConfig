{inputs, ...}: {
  flake.modules.homeManager.nixvim-completion = {pkgs, ...}: {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          completion = {
            accept.auto_brackets.enabled = true;
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
              treesitter_highlighting = true;
              window.border = "single";
            };
            ghost_text.enabled = true;
            menu = {
              border = "none";
            };
          };

          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
              "dictionary"
              "ripgrep"
            ];
            providers = {
              dictionary = {
                module = "blink-cmp-dictionary";
                name = "Dict";
                score_offset = 100;
                min_keyword_length = 3;
              };
              ripgrep = {
                async = true;
                module = "blink-ripgrep";
                name = "Ripgrep";
                score_offset = 100;
                opts = {
                  prefix_min_len = 3;
                  context_size = 5;
                  max_filesize = "1M";
                  project_root_marker = ".git";
                  project_root_fallback = true;
                  search_casing = "--ignore-case";
                  # additional_rg_options = {};
                  fallback_to_regex_highlighting = true;
                  # ignore_paths = {};
                  # additional_paths = {};
                  debug = false;
                };
              };
            };
          };
        };
      };
      blink-cmp-dictionary.enable = true;
      blink-ripgrep.enable = true;
      luasnip.enable = true;
      friendly-snippets.enable = true;
    };
    dependencies = {
      curl.enable = true;
      fzf.enable = true;
      git.enable = true;
    };
  };
}
