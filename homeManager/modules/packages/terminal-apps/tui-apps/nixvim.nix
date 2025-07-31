{
  config,
  lib,
  system,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.nixvim {
    home.packages = [inputs.nixvim-config.packages.${system}.default];

    stylix.targets = {
      neovim.enable = false;
      nixvim.enable = false;
      vim.enable = false;
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
