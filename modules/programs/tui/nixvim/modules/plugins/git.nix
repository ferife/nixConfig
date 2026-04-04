{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-git = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-git = {pkgs, ...}: {
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs.delete.show_count = true;
        trouble = true;
      };
    };
  };
}
