{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    # ./general-settings-25-05.nix
    ./general-settings-unstable.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (config.nixos.specialArgs.system-settings.desktop-environment == "gnome") {
      nixos.gnome.enable = lib.mkForce true;
    })
  ];
}
