{inputs, ...}: {
  flake.modules.homeManager.nixvim-hardtime = {pkgs, ...}: {
    plugins.hardtime.enable = true;
  };
}
