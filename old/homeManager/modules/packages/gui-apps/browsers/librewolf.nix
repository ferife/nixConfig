{
  config,
  lib,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.specialArgs.user-settings.browser == "librewolf") {
      hm.librewolf = lib.mkForce true;
    })

    (lib.mkIf config.hm.librewolf {
      # Go to ./firefox-options.nix for the firefox hm options

      # programs.librewolf = config.hm.ff-config;
      programs.librewolf = {
        package = pkgs-stable.librewolf;
        enable = true;
        policies = config.hm.ff-config.policies;
        nativeMessagingHosts = config.hm.ff-config.nativeMessagingHosts;
        profiles = config.hm.ff-config.profiles;
      };

      stylix.targets.librewolf = config.stylix.targets.firefox;

      # Variable is used to restore librewolf profiles through gas
      # home.sessionVariables = {
      #   LIBREWOLF_ACTIVE = "1";
      # };
    })

    # (lib.mkIf (config.hm.librewolf && config.hm.gnome.enable) {
    (lib.mkIf ((config.hm.specialArgs.user-settings.browser == "librewolf") && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["librewolf.desktop"];};
    })

    # (lib.mkIf (!config.hm.librewolf) {
    #   home.sessionVariables = {
    #     LIBREWOLF_ACTIVE = "";
    #   };
    # })
  ];
}
