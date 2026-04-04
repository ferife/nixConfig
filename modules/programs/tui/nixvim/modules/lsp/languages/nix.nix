{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-nix = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-nix = {
    lib,
    pkgs,
    ...
  }: {
    plugins.lsp.servers.nixd = {
      enable = true;
      cmd = ["nixd"];
      settings = let
        flake =
          # Nix
          ''(builtins.getFlake "github:ferife/nixConfig")'';
      in {
        nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
        formatting.command = ["${lib.getExe pkgs.alejandra}"];
        options.nixos.expr =
          # Nix
          ''${flake}.nixosConfigurations.laptop.options'';
      };
    };
  };
}
