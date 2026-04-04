{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-bash = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-bash = {pkgs, ...}: {
    plugins.lsp.servers = {
      awk_ls = {
        enable = true;
        package = pkgs.awk-language-server;
      };
      bashls.enable = true;
    };
    dependencies.coreutils.enable = true;
  };
}
