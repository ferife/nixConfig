{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvimModules = {pkgs, ...}: {};

  flake.modules.homeManager.nixvimModules = {pkgs, ...}: {
    clipboard = {
      reguster = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };
    viAlias = true;
    vimAlias = true;
    opts = {
      number = true; # Adds line numbers
      relativenumber = true;
      linebreak = true;
      shiftwidth = 2;
      scrolloff = 5;
    };
    wrapRc = true;
  };
}
