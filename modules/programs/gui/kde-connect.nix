{inputs, ...}: {
  # KDE connect is a program that allows for connection between this and other devices, such as smartphones

  flake.modules.nixos.kde-connect = {pkgs, ...}: {
    programs.kdeconnect.enable = true;
  };

  flake.modules.homeManager.kde-connect = {pkgs, ...}: {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
