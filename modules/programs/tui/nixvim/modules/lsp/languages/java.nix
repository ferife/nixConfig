{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-java = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-java = {pkgs, ...}: {
    # plugins.lsp.servers.jdtls.enable = true;
    # plugins.jdtls = {};
  };
}
