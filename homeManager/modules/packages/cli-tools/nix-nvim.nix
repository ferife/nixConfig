{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    nixNvimModule.enable = lib.mkEnableOption "Installs & configures Neovim, but through a mixture of nix and lua";
  };

  config = lib.mkIf config.nixNvimModule.enable {
    fonts.fontconfig.enable = true;

    # To add a plugin that aren't in <nixpkgs>, add the following two lines of code to the inputs section in flake.nix
    # plugin-onedark.url = "github:navarasu/onedark.nvim";
    # plugin-onedark.flake = false;
    # After that, Add the plugin to the following nix overlay to put it in nixpkgs

    # nixpkgs = {
    #   overlays = [
    #     (final: prev: {
    #       vimPlugins = prev.vimPlugins // {
    #         own-onedark-nvim = prev.vimUtils.buildVimPlugin {
    #           name = "onedark";
    #           src = inputs.plugin-onedark;
    #         };
    #         plugin2 = prev.vimUtils.buildVimPlugin {
    #           name = "plugin2";
    #           src = inputs.plugin2;
    #         };
    #       };
    #     })
    #   ];
    # };

    programs.neovim = let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in {
      enable = true;

      # The lines below make it so that if a program tries using the programs below, they use NeoVim instead
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;

      # extraLuaConfig = ''
      #   -- Write lua code here
      #   -- or interpolate files like this
      #   ${builtins.readFile ./advent-of-nvim/init.lua}
      # '';

      plugins = with pkgs.vimPlugins; [
        # {
        #   plugin = own-onedark-nvim;
        #   config = "colorscheme onedark";
        # }

        {
          plugin = blink-cmp;
          config = ./nix-nvim/plugins/lspconfig.lua;
        }
        {
          plugin = comment-nvim;
          config = toLua "require('Comment').setup()";
        }
        friendly-snippets
        {
          plugin = image-nvim;
          # config = ;
        }
        {
          plugin = lualine-nvim;
          config = toLua "require('lualine').setup()";
        }
        luasnip
        {
          plugin = mini-nvim;
          config = toLuaFile ./nix-nvim/plugins/mini-nvim.lua;
        }
        {
          plugin = lazydev-nvim;

        }
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./nix-nvim/plugins/lspconfig.lua;
        }
        {
          plugin = obsidian-nvim;
          config = toLuaFile ./nix-nvim/plugins/obsidian.lua;
        }
        {
          plugin = onedark-nvim;
          config = toLuaFile ./nix-nvim/plugins/colorscheme/onedark-nvim.lua;
        }
        {
          plugin = telescope-fzf-native-nvim;
          config = toLuaFile ./nix-nvim/plugins/lspconfig.lua;
        }
        {
          plugin = telescope-nvim;
          config = toLuaFile ./nix-nvim/plugins/telescope.lua;
        }
        {
          plugin = (nvim-treesitter.withPlugins (luaPkgs: with luaPkgs; [
            # These can be found on search.nixos.org being preceded by `tree-sitter-grammars.`
            # tree-sitter-bash
            tree-sitter-c
            # tree-sitter-css
            # tree-sitter-html
            tree-sitter-java
            # tree-sitter-latex
            tree-sitter-lua
            tree-sitter-markdown
            tree-sitter-nix
            tree-sitter-vim
          ]));
          config = toLuaFile ./nix-nvim/plugins/treesitter.lua;
        }
      ];

      extraLuaPackages = luaPkgs: with luaPkgs; [ magick ];

      extraPackages = with pkgs; [
        fd
        gcc
        gnumake
        ripgrep
        tree-sitter
        unzip
        wl-clipboard
        imagemagick # Necessary to render images inside Neovim

        # ueberzugpp # Used to render images inside neovim. Should only be used if not using the Kitty terminal emulator nor an emulator that uses Kitty's Graphics Protocol

        # Language servers
        bash-language-server  # Bash
        ccls                  # C/C++
        java-language-server  # Java
        lua-language-server   # Lua
        nixd                  # Nix
        alejandra             # Nix Autoformat
      ];

      withPython3 = true;

      # There's a few dependencies that needed to be installed system-wide for this to work. They are getting installed in nixos/modules/packages/module-bundle.nix
    };

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; # Recommended when using nixd LSP
    # Allows referencing of nixpkgs exactly as it exists in my system (with any custom changes to it applied)
  };
}
