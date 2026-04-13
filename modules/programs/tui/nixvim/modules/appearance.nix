{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-appearance = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-appearance = {pkgs, ...}: {
    plugins = {
      cursorline = {
        enable = true;
        settings = {
          cursorline.timeout = 500;
          cursorword.enable = false;
        };
      };
      indent-blankline = {
        enable = true;
        settings.scope.enabled = true;
      };
      lualine.enable = true;
      mini-trailspace.enable = true;
      numbertoggle.enable = true;
      # rainbow-delimiters.enable = true;
      virt-column = {
        enable = true;
        settings = {
          char = "|";
          virtcolumn = "80,120";
        };
      };
      web-devicons.enable = true;
    };
  };
}
