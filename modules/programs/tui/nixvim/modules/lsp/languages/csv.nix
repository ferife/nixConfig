{inputs, ...}: {
  flake.modules.homeManager.nixvim-csv = {pkgs, ...}: {
    plugins.csvview.enable = true;
  };
}
