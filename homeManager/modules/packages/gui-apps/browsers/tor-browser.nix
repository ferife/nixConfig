{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.specialArgs.user-settings.browser == "tor-browser") {
      hm.tor-browser = lib.mkForce true;
    })
    (lib.mkIf (config.hm.tor-browser) {
      home.packages = with pkgs-unstable; [tor-browser];

      # services.tor = {
      #   enable = true;
      # };
    })

    # (lib.mkIf (config.hm.tor-browser && config.hm.gnome.enable) {
    (lib.mkIf ((config.hm.specialArgs.user-settings.browser == "tor-browser") && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["torbrowser.desktop"];};
    })
  ];
}
