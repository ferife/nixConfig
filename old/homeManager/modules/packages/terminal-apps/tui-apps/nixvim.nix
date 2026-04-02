{
  config,
  lib,
  system,
  inputs,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.nixvim {
    home.packages = [inputs.nixvim-config.packages.${system}.default];
    programs.gcc.enable = true;

    stylix.targets = {
      neovim.enable = false;
      nixvim.enable = false;
      vim.enable = false;
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
