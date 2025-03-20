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
    ./mullvad-vpn.nix
    ./vlc.nix
  ];

  nixos = {
    androidStudio = true;
    gaming.enable = lib.mkDefault true;
    mullvadVpn = lib.mkDefault true;
    vlc = {
      enable = lib.mkDefault true;
    };
  };
}
