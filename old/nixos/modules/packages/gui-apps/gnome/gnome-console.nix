{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.nixos.gnome-console {})
    (lib.mkIf (!config.nixos.gnome-console) {
      environment.gnome.excludePackages = [pkgs.gnome-console];
    })
  ];
}
