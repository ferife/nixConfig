{inputs, ...}: {
  # Proton Mail is an email client

  flake.modules.homeManager.proton-mail = {pkgs, ...}: {
    home.packages = [pkgs.protonmail-desktop];

    dconf.settings = {"org/gnome/shell".favorite-apps = ["proton-mail.desktop"];};
  };
}
