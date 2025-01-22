{ config, lib, pkgs, inputs, ... }:
{
  options = {
    neovimModule.enable = lib.mkEnableOption "Installs & configures Neovim, a TUI text editor";
  };

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

      extraLuaPackages = luaPkgs: with luaPkgs; [
        magick
        luarocks
      ];

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
        java-language-server  # Java
        lua-language-server   # Lua
        nixd                  # Nix
      ];

      withPython3 = true;

      # There's a few dependencies that needed to be installed system-wide for this to work. They are getting installed in nixos/modules/packages/module-bundle.nix
    };
  };
}
