{ config, lib, pkgs, inputs, ... }:
{
  options = {
    neovimModule = {
      enable = lib.mkEnableOption "Installs & configures Neovim, a TUI text editor";
    };
  };

  # Plugin stuff
  # Switch commentary-nvim for comment-nvim
  # Set up image-nvim and obsidian-nvim
  # Set up luasnip
  # Set up all the mini plugins the same way they are in nix-nvim
  # Set up lazydev-nvim
  # Make the color scheme side of things more modular
  # Set up telescope-fzf-native-nvim
  # Set up treesitter with parsers for bash, C, HTML/CSS/JS, Java, markdown, nix and vim

  # Other options
  # Completely disallow mouse usage

  config = lib.mkIf config.neovimModule.enable {

    xdg.configFile."nvim".source = ./advent-of-nvim;

    fonts.fontconfig.enable = true;

    stylix.targets.neovim.enable = false;
    # So that I can style it exclusively using Lua

    programs.neovim = {
      enable = true;

      # The lines below make it so that if a program tries using the programs below, they use NeoVim instead
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      defaultEditor = true;

      # extraLuaPackages = luaPkgs: with luaPkgs; [ magick ];

      extraPackages = with pkgs; [
        fd
        gcc
        gnumake
        # imagemagick
        ripgrep
        tree-sitter
        # ueberzugpp # Used to render images inside neovim. Should only be used if not using the Kitty terminal emulator nor an emulator that uses Kitty's Graphics Protocol
        unzip
        wl-clipboard

        # Language servers
        bash-language-server  # Bash
        ccls                  # C/C++
        java-language-server  # Java
        lua-language-server   # Lua
        nixd                  # Nix
        alejandra             # Nix Autoformat
      ];

      withPython3 = true;

      # extraLuaConfig = ''
      #   -- Write lua code here
      #   -- or interpolate files like this
      #   ${builtins.readFile ./advent-of-nvim/init.lua}
      # '';

      # There's a few dependencies that needed to be installed system-wide for this to work. They are getting installed in nixos/modules/packages/default.nix
    };

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; # Recommended when using nixd LSP
    # Allows referencing of nixpkgs exactly as it exists in my system (with any custom changes to it applied)
  };
}
