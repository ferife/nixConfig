{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.astal {
    home.packages = with inputs.astal.packages.${system}; [
      default

      # io
      # astal3
      # astal4
      # apps
      # auth
      # battery
      # bluetooth
      # cava
      # greet
      # hyprland
      # mpris
      # network
      # notifd
      # powerprofiles
      # river
      # tray
      # wireplumber
    ];
  };
}
