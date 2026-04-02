{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.nixos.vlc.enable) {
      environment.systemPackages = with pkgs; [vlc];
    })

    (lib.mkIf (config.nixos.vlc.enable && config.nixos.gnome.enable) {
      environment.gnome = lib.mkIf config.nixos.vlc.replaceGnomeDefault {
        excludePackages = with pkgs; [
          gnome-music # Audio Player
          totem # Video Player
        ];
      };
    })
  ];
}
