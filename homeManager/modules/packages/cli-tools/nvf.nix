{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    nvfModule.enable = lib.mkEnableOption "Installs & configures NVF, a special version of Neovim made to be configured through Nix";
  };

  config = lib.mkIf config.nvfModule.enable {
    fonts.fontconfig.enable = true;

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    programs.nvf = {
      enable = true;

      # The lines below make it so that if a program tries using the programs below, they use NeoVim instead
      settings.vim.viAlias = true;
      settings.vim.vimAlias = true;

      # defaultEditor = true;

      settings.vim.disableArrows = true;
      settings.vim.lineNumberMode = "relNumber";
      settings.vim.preventJunkFiles = true;
      settings.vim.scrollOffset = 10;
      settings.vim.searchCase = "smart";
      settings.vim.syntaxHighlighting = true;
      settings.vim.options = {
        autoindent = true;
        shiftwidth = 2;
        tabstop = 2;
        wrap = true;
      };

      # Appearance
      settings.vim.theme = {
        enable = true;
        name = "onedark";
      };
      settings.vim.ui = {
        borders = {
          enable = true;
          globalStyle = "rounded";

          plugins = {
            # fastaction.enable = true;
            lsp-signature.enable = true;
            # lspsaga.enable = true;
            which-key.enable = true;
          };
        };

        breadcrumbs = {
          enable = true;
          lualine.winbar.enable = true;

          navbuddy = {
            enable = true;
            # mappings = {
            #   appendName = "a";       # insert at end of name
            #   appendScope = "A";      # insert at end of scope

            #   insertName = "i";       # insert at start of name
            #   insertScope = "I";      # insert at start of scope

            #   visualName = "v";       # visual selection of name
            #   visualScope = "V";      # visual selection of scope

            #   yankName = "y";         # yank name to system clipboard
            #   yankScope = "Y";        # yank scope to system clipboard

            #   root = "0";             # navigate to root node
            #   parent = "h";           # navigate to parent node
            #   children = "l";         # navigate to child node
            #   nextSibling = "j";      # navigate to next sibling
            #   previousSibling = "k";  # navigate to previous sibling
            #   select = "<enter>";     # go to selected symbol

            #   close = "<esc>";        # close Navbuddy UI

            #   comment = "c";          # comment the node
            #   delete = "d";           # delete the node

            #   foldCreate = "f";       # create a new fold
            #   foldDelete = "F";       # delete the current fold

            #   help = "g?";            # open mapping help window

            #   moveDown = "J";         # move focused node down
            #   moveUp = "K";           # move focused node up

            #   rename = "r";           # rename the node

            #   telescope = "t";        # fuzzy finder at current level
            # };
          };
        };

        colorizer.enable = true;
        fastaction.enable = true;
        illuminate.enable = true;
        modes-nvim.enable = true;
        smartcolumn = {
          enable = true; # vertical bar appears when exceeding max chars in line
          setupOpts.colorcolumn = ["80" "120"];
          setupOpts.disabled_filetypes = ["markdown"];
        };
      };

      # Globals
      settings.vim.globals = {
        mapleader = " ";
        # maplocalleader = ",";
      };

      # LSP Stuff
      settings.vim.languages = {
        enableLSP = true;
        enableTreesitter = true;
        enableFormat = true; # Auto Formatting

        clang.enable = true;
        html.enable = true;
        java.enable = true;
        lua.enable = true;
        markdown.enable = true;
        nix = {
          enable = true;
          lsp.package = pkgs.nixd;
        };
      };
      settings.vim.lsp = {
        enable = true;
        lspconfig.enable = true; # github:neovim/nvim-lspconfig

        lspSignature.enable = true; # github:ray-x/lsp_signature.nvim
        # lsplines.enable = true; # Leaving disabled for now, but might consider in the future
        # lspsaga.enable = true;  # github:nvimdev.lspsaga.nvim

        # trouble.enable = true;

        # mappings = {
        #   addWorkspaceFolder = "<leader>lwa";
        #   codeAction = "<leader>la";
        #   documentHighlight = "<leader>lH";
        #   format = "<leader>lf";
        #   goToDeclaration = "<leader>lgD";
        #   goToDefinition = "<leader>lgd";
        #   goToType = "<leader>lgt";
        # };

        formatOnSave = true;
      };

      # Keymaps
      # settings.vim.keymaps = [
      #   {
      #     key = "<leader>m";
      #     mode = "n";
      #     silent = true;
      #     action = ":make<CR>";
      #     desc = "Description shown by which-key";
      #   }
      #   {
      #     key = "<leader>l";
      #     mode = ["n" "x"];
      #     silent = true;
      #     action = "<cmd>cnext<CR>";
      #   }
      # ];

      # Snippets
      settings.vim.snippets.luasnip = {
        enable = true;
        providers = [
          "friendly-snippets"
        ];
      };

      # Spellcheck
      settings.vim.spellcheck = {
        enable = true;

        programmingWordlist.enable = true; # Enables settings.vim.dirtytalk
      };

      # Plugins
      settings.vim.utility.outline.aerial-nvim = {
        enable = true;
        # mappings.toggle = "g0";
      };

      settings.vim.autocomplete.nvim-cmp = {
        # github:hrsh7th/nvim-cmp
        enable = true;
        # sourcePlugins = [
        #   "obsidian.nvim"
        #   "yaml-tags" # Tags facilitator for .md files (I want it for Obsidian.md)
        #   "nerdfont"
        #   "latex_symbols"
        # ];
      };

      settings.vim.autopairs.nvim-autopairs.enable = true;

      settings.vim.binds = {
        cheatsheet.enable = true; # github:sudomrfbin/cheatsheet.nvim
        whichKey.enable = true; # github:folke/which-key.nvim
      };

      settings.vim.comments.comment-nvim = {
        enable = true;
        # mappigs = {
        #   toggleCurrentBlock = "gbc";
        #   toggleCurrentLine = "gcc";

        #   toggleOpLeaderBlock = "gb";
        #   toggleOpLeaderLine = "gc";

        #   toggleSelectedBlock = "gb";
        #   toggleSelectedLine = "gc";
        # };
      };

      settings.vim.git = {
        enable = true; # Enables gitsigns and vim-fugitive
        # gitsigns.mappings = {
        #   blameline = "<leader>hb";

        #   diffProject = "<leader>hD";
        #   diffThis = "<leader>hd";

        #   previousHunk = "<leader>[c";
        #   nextHunk = "]c";
        #   previewHunk = "<leader>hP";

        #   resetBuffer = "<leader>hR";
        #   resetHunk = "<leader>hr";

        #   stageBuffer = "<leader>hS";
        #   stageHunk = "<leader>hs";
        #   undoStageHunk = "<leader>hu";

        #   toggleBlame = "<leader>tb";
        #   toggleDeleted = "<leader>td";
        # };
      };

      settings.vim.notes = {
        todo-comments = {
          enable = true; # github:folke/todo-comments.nvim
          # mappings = {
          #   quickFix = "<leader>tdq";
          #   telescope = "<leader>tds";
          #   trouble = "<leader>tdt";
          # };
        };

        obsidian = {
          enable = true;

          setupOpts = {
            workspaces = [
              {
                name = "personal";
                path = "~/Documents/obsidian-vault/";
              }
            ];
            completion.nvim_cmp = true;
            # daily_notes = {
            #   date_format = "";
            #   folder = "";
            # };
            ui.conceallevel = "2";
          };
        };
      };

      settings.vim.runner.run-nvim = {
        enable = true;
        # mappings.run = "<leader>ri";
      };

      settings.vim.statusline.lualine.enable = true;

      settings.vim.telescope = {
        # nvim-telescope/telescope.nvim
        enable = true;

        mappings = {
          findFiles = "<leader>fd";
          helpTags = "<leader>fh";
          liveGrep = "<leader>fg";
          lspDefinitions = "<leader>flD";
        };
      };

      settings.vim.terminal.toggleterm = {
        enable = true;
        mappings.open = "<leader>tt";
        lazygit = {
          enable = true;
          direction = "float";
          # mappings.open = "<leader>gg";
        };
      };

      settings.vim.treesitter = {
        # github:nvim-treesitter/nvim-treesitter
        context.enable = true;
        highlight.enable = true;
        fold = true;
        indent.enable = true;

        incrementalSelection.enable = true;
        # mappings.incrementalSelection = {
        #   init = "gnn";
        #   decrementByNode = "grm";
        #   incrementByNode = "grn";
        #   incrementByScope = "grc";
        # };

        autotagHtml = true;
      };

      # vim.utility
      settings.vim.utility = {
        diffview-nvim.enable = true;
        icon-picker.enable = true; # nerdfonts icon picker
        images.image-nvim = {
          enable = true;
          setupOpts = {
            backend = "kitty";
            integrations.markdown = {
              enable = true;
              # clearInInsertMode = true;
              downloadRemoteImages = true;
            };
          };
        };
        motion.precognition.enable = true; # Display hints for horizontal and vertical motions
        new-file-template.enable = true;
        preview.markdownPreview.enable = true;
        surround = {
          enable = true;
          # setupOpts.keymaps = {
          #   change = "gzr";
          #   change_line = "gZR";

          #   insert = "<C-g>z";
          #   insert_line = "<C-g>Z";

          #   normal = "gz";
          #   normal_line = "gzz";
          #   normal_cur = "gZ";
          #   normal_cur_line = "gZZ";

          #   visual = "gz";
          #   visual_line = "gZ";
          # };
        };
      };

      settings.vim.visuals = {
        indent-blankline.enable = true;
        nvim-cursorline = {
          enable = true;
          setupOpts.cursorline.enable = true;
        };
        nvim-web-devicons.enable = true;
      };

      settings.vim.extraPackages = with pkgs; [
        fd
        fzf
        gnumake
        ripgrep
        tree-sitter
        unzip
        wl-clipboard
        nixd
      ];

      # settings.vim.extraPlugins = {};

      settings.vim.extraLuaFiles = [
        ./nvf/conceallevel.lua
      ];
    };
  };
}
