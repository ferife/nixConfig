{inputs, ...}: {
  flake.modules.homeManager.nixvim-lua = {pkgs, ...}: {
    plugins.lsp.servers.lua_ls = {
      enable = true;
      settings = {
        telemetry.enable = false;
      };
    };
  };
}
