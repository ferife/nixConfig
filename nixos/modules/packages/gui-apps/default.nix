{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gaming
    ./gnome
    ./android-studio.nix
    ./kitty.nix
    ./vlc.nix
  ];

  nixos = {
    # androidStudio = lib.mkDefault false;
    gaming.enable = lib.mkDefault true;
    kitty = lib.mkDefault true;
    vlc = {
      enable = lib.mkDefault true;
    };
  };
}
