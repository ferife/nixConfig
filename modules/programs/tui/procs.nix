{inputs, ...}: {
  # procs is a tool to print the contents of text files to the terminal
  #
  # flake.modules.nixos.procs = {pkgs, ...}: {};

  flake.modules.homeManager.procs = {pkgs, ...}: {
    home.packages = [pkgs.procs];
    home.shellAliases.ps = "procs";
  };
}
