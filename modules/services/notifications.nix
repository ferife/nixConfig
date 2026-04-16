{inputs, ...}: {
  # This module adds a package that can be used for custom notifications, including ones specified through shell scripts

  flake.modules.homeManager.notifications = {pkgs, ...}: {
    home.packages = [pkgs.libnotify];
  };
}
