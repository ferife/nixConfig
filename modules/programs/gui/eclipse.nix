{inputs, ...}: {
  # Eclipse is an IDE made to primarily work with Java
  #
  # flake.modules.nixos.eclipse = {pkgs, ...}: {};

  flake.modules.homeManager.eclipse = {pkgs, ...}: {
    programs.eclipse = {
      enable = true;
      package = pkgs.eclipses.eclipse-java;
    };
  };
}
