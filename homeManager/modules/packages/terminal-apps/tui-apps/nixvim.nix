{
  config,
  lib,
  system,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.nixvim {
    home.packages = [inputs.nixvim-config.packages.${system}.default];
    stylix.targets.neovim.enable = false;
    stylix.targets.nixvim.enable = false;
    stylix.targets.vim.enable = false;
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
# TODO: Make it so that every time I open nixvim, it shows the name of the latest active commit
# This is so that I know whether I need to update the flake input to achieve what I want

