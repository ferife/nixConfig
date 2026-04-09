{inputs, ...}: {
  # NixVim is a code editor

  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  # flake.modules.nixos.nixvim = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim = {pkgs, ...}: {
    imports = [inputs.nixvim.homeModules.nixvim];

    programs.lazygit.settings.os.editPreset = "nvim";
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimdiffAlias = true;
      imports = [inputs.self.modules.homeManager.nixvim-modules];
    };
  };
}
