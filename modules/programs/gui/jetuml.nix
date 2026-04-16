{inputs, ...}: {
  # JetUML is an app for UML diagramming

  flake.modules.homeManager.jetuml = {pkgs, ...}: {
    home.packages = [pkgs.jetuml];
  };
}
