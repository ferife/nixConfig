{inputs, ...}: {
  flake.modules.homeManager.nixvim-yanky = {pkgs, ...}: {
    plugins.yanky = {
      enable = true;
      settings.highlight = {
        on_put = true;
        on_yank = true;
        timer = 500; # In Milliseconds
      };
    };
  };
}
