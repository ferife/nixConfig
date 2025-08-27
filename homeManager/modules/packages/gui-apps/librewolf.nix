{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.specialArgs.user-settings.browser == "librewolf") {
      hm.librewolf = lib.mkForce true;
    })

    (lib.mkIf config.hm.librewolf {
      # Go to ./firefox-options.nix for the firefox hm options

      programs.librewolf = config.hm.ff-config;
      stylix.targets.librewolf = config.stylix.targets.firefox;

      # Variable is used to restore librewolf profiles through gas
      # home.sessionVariables = {
      #   LIBREWOLF_ACTIVE = "1";
      # };
    })
    # (lib.mkIf (!config.hm.librewolf) {
    #   home.sessionVariables = {
    #     LIBREWOLF_ACTIVE = "";
    #   };
    # })
  ];
}
