{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.nixos.specialArgs.system-settings.desktop-environment == "gnome") {
      nixos.login-manager.name = lib.mkForce "gdm";
    })

    (lib.mkIf (config.nixos.gnome.enable && config.nixos.plasma.enable) {
      programs.seahorse.enable = lib.mkForce false;
    })

    (lib.mkIf config.nixos.gnome.enable {
      services = {
        desktopManager.gnome.enable = true; # FIXME: UNSTABLE

        gnome.gnome-browser-connector.enable = true; # Allows for GNOME extensions to affect browsers
      };
    })
  ];
}
