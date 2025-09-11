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
    ./vlc.nix
  ];

  nixos = {
    # androidStudio = lib.mkDefault false;
    gaming.enable = lib.mkDefault true;
    vlc = {
      enable = lib.mkDefault true;
    };
  };
}
