{
  config,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.specialArgs.user-settings.browser == "firefox") {
      hm.firefox = lib.mkForce true;
    })
    (lib.mkIf (config.hm.firefox) {
      # Go to ./firefox-options.nix for the firefox hm options

      programs.firefox = config.hm.ff-config;
    })
  ];
}
