{inputs, ...}: {
  # btop is a system resource monitor

  flake.modules.homeManager.btop = {pkgs, ...}: {
    programs.btop.enable = true;
  };
}
