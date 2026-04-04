{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-lua = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-lua = {pkgs, ...}: {
    plugins.lsp.servers.lua_ls = {
      enable = true;
      settings = {
        telemetry.enable = false;
      };
    };
  };
}
