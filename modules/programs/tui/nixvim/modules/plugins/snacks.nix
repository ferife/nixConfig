{inputs, ...}: {
  # Snacks is a plugin by folke with essentially acts as a collection of smaller plugins

  flake.modules.homeManager.nixvim-snacks = {pkgs, ...}: {
    plugins.snacks = {
      enable = true;
      settings = {
        bigfile.enable = true; # Deals with large files
        image.enable = true; # View image within nvim (uses Kitty Graphics Protocol)
      };
    };
  };
}
