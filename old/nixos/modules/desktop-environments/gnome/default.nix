{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./general-settings.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (config.nixos.specialArgs.system-settings.desktop-environment == "gnome") {
      nixos.gnome.enable = lib.mkForce true;
    })
  ];
}
