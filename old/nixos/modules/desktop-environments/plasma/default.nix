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
    (lib.mkIf (config.nixos.specialArgs.system-settings.desktop-environment == "plasma") {
      nixos.plasma.enable = lib.mkForce true;
    })
  ];
}
