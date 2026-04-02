{
  config,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.specialArgs.user-settings.browser == "chromium") {
      hm.chromium = lib.mkForce true;
    })
    (lib.mkIf (config.hm.chromium) {
      programs.chromium.enable = true;
      # User-Agent Switcher plugin: https://chromewebstore.google.com/detail/user-agent-switcher/dbclpoekepcmadpkeaelmhiheolhjflj
    })

    (lib.mkIf (config.hm.chromium && config.hm.gnome.enable) {
      # (lib.mkIf ((config.hm.specialArgs.user-settings.browser == "chromium") && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["chromium-browser.desktop"];};
    })
  ];
}
