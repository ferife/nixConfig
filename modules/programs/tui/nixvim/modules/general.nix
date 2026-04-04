{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-general = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-general = {pkgs, ...}: {
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

    dependencies = {
      nodejs.enable = true;
    };
  };
}
