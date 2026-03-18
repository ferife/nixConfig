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
    ./ghostty.nix
    ./kitty.nix
    ./vlc.nix
  ];

  nixos = {
    # android-studio = lib.mkDefault false;
    gaming.enable = lib.mkDefault true;
    ghostty = lib.mkDefault true;
    # kitty = lib.mkDefault false;
    vlc = {
      enable = lib.mkDefault true;
    };
  };
}
