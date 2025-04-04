{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  config = lib.mkIf config.hm.floorp {
    # Go to ./firefoxOptions.nix for the firefox hm options

    programs.floorp.enable = true;
    stylix.targets.floorp.profileNames = config.stylix.targets.firefox.profileNames;
    # programs.floorp.enableGnomeExtensions = config.programs.firefox.enableGnomeExtensions;
    programs.floorp.nativeMessagingHosts = config.programs.firefox.nativeMessagingHosts;
    programs.floorp.policies = config.programs.firefox.policies;
    programs.floorp.profiles = config.programs.firefox.profiles;
  };
}
