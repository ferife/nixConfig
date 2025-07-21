{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gaming
    ./android-studio.nix
    ./mullvad.nix
    ./vlc.nix
  ];

  nixos = {
    androidStudio = lib.mkDefault false;
    gaming.enable = lib.mkDefault true;
    mullvadVpn = lib.mkDefault true;
    vlc = {
      enable = lib.mkDefault true;
    };
  };
}
