{inputs, ...}: {
  flake.modules.homeManager.nixvim-precognition = {pkgs, ...}: {
    plugins.precognition.enable = true;
  };
}
