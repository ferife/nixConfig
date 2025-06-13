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
    })
  ];
}
