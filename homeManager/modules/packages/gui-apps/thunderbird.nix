{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  config = lib.mkIf config.hm.thunderbird {
    programs.thunderbird = {
      enable = true;
      # profiles.${userSettings.username}.name = "Fernando RF";
    };
  };
  # TODO: Switch to programs.thunderbird.enable
}
