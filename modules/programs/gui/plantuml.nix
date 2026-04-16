{inputs, ...}: {
  # plantuml is a GUI used to create and view UML diagrams

  flake.modules.homeManager.plantuml = {pkgs, ...}: {
    home.packages = [
      pkgs.plantuml
      pkgs.graphviz # Might as well, since it's needed for a few diagram types
    ];
  };
}
