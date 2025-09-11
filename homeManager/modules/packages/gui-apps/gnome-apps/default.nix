{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./cheese.nix
    ./calculator.nix
    ./clocks.nix
    ./console.nix
    ./loupe.nix
    ./nautilus.nix
    ./terminal.nix
  ];

  hm = {
    cheese = lib.mkDefault true;
    gnome-calculator = lib.mkDefault true;
    gnome-clocks = lib.mkDefault true;
    gnome-console = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "gnome-console") true;
    gnome-terminal = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "gnome-terminal") true;
    loupe = lib.mkDefault true;
    # nautilus = false;
  };
  # The GUI used by GNOME for volume control is pavucontrol

  # Default apps installed by GNOME can be viewed in the link below.
  # Any list passed as an argument to the utils.removePackagesByName, where the other argument is config.environment.gnome.excludePackages, is part of the packages that can be removed from GNOME
  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/desktop-managers/gnome.nix
}
