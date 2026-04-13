{inputs, ...}: {
  # VS Code is a code editor
  #
  # flake.modules.nixos.vs-code = {pkgs, ...}: {};

  flake.modules.homeManager.vs-code = {pkgs, ...}: {
    programs = {
      vscode.enable = true;
      gcc.enable = true;
    };
    home.packages = [pkgs.gnumake];
  };
}
