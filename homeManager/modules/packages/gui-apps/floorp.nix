{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.floorp {
      # Go to ./firefox-options-(un)stable.nix for the firefox hm options

      programs.floorp = config.hm.ff-config;
      stylix.targets.floorp = config.stylix.targets.firefox;

      # Variable is used to restore floorp profiles through gas
      home.sessionVariables = {
        FLOORP_ACTIVE = "1";
      };
    })
    (lib.mkIf (!config.hm.floorp) {
      home.sessionVariables = {
        FLOORP_ACTIVE = "";
      };
    })
  ];
}
