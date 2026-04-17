{inputs, ...}: {
  flake.modules.homeManager.nixvim-appearance = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      nixvim-statuscolumn
    ];

    colorschemes.onedark.settings = {
      code_style.comments = "italic";
      diagnostics.undercurl = true;
    };

    plugins = {
      # Highlight line that cursor is on
      cursorline = {
        enable = true;
        settings = {
          cursorline.timeout = 500;
          cursorword.enable = false;
        };
      };

      # Add indent guides
      indent-blankline = {
        enable = true;
        settings.scope.enabled = true;
      };

      lualine.enable = true; # Add status line
      mini-trailspace.enable = true; # Highlight whitespace at end of line
      numbertoggle.enable = true; # Switch to non-relative numbers when in insert mode
      rainbow-delimiters.enable = true; # Use different colors for containing characters ()[]{}

      # Add a visible line at the designated character limit
      virt-column = {
        enable = true;
        settings = {
          char = "|";
          virtcolumn = "80,120";
        };
      };

      web-devicons.enable = true; # Adds nerdfont support for nvim plugins
    };
  };
}
