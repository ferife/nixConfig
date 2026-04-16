{inputs, ...}: {
  flake.modules.homeManager.nixvim-spider = {pkgs, ...}: {
    plugins.spider = {
      enable = true;
      keymaps.motions = {
        b = "b";
        e = "e";
        ge = "ge";
        w = "w";
      };
    };
  };
}
