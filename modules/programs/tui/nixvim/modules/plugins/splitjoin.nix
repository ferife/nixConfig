{inputs, ...}: {
  flake.modules.homeManager.nixvim-splitjoin = {pkgs, ...}: {
    plugins.mini-splitjoin = {
      enable = true;
      mappings.toggle = "gS";
    };
  };
}
