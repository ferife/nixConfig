{inputs, ...}: {
  flake.modules.homeManager.nixvim-java = {pkgs, ...}: {
    # plugins.lsp.servers.jdtls.enable = true;
    # plugins.jdtls = {};
  };
}
