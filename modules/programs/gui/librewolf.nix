{inputs, ...}: {
  # Librewolf is a privacy-focused firefox-based browser
  #
  # flake.modules.nixos.librewolf = {pkgs, ...}: {};

  flake.modules.homeManager.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
    };

    stylix.targets.librewolf.colorTheme.enable = true;
    dconf.settings."org/gnome/shell".favorite-apps = ["librewolf.desktop"];
  };
}
