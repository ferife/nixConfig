{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./browsers
    ./gnome-apps
    ./obsidian
    ./plasma-apps
    ./audacity.nix
    ./eclipse.nix
    ./ghostty.nix
    ./gimp.nix
    ./jetuml.nix
    ./keepassxc.nix
    ./kitty.nix
    ./libreoffice.nix
    ./mpv.nix
    ./mullvad.nix
    ./obs-studio.nix
    ./openshot.nix
    ./proton-mail.nix
    ./qbittorrent.nix
    ./thunderbird.nix
    ./vlc.nix
    ./vs-code.nix
  ];

  hm = {
    # audacity = lib.mkDefault false;
    # eclipse = lib.mkDefault false;
    ghostty = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "ghostty") true;
    # gimp = lib.mkDefault false;
    # jetuml = lib.mkDefault false;
    keepassxc = lib.mkDefault true;
    kitty = lib.mkIf (config.hm.specialArgs.user-settings.terminal == "kitty") true;
    libreoffice = lib.mkDefault true;
    mpv = lib.mkDefault true;
    mullvad = lib.mkDefault true;
    # obsStudio = lib.mkDefault false;
    # openshot = lib.mkDefault false;
    proton-mail = lib.mkDefault true;
    qbittorrent = lib.mkDefault true;
    thunderbird = lib.mkDefault true;
    # vlc = lib.mkDefault false;
    # vsCode = lib.mkDefault false;
  };
}
