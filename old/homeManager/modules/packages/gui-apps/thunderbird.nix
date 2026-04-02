{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.thunderbird {
    programs.thunderbird = {
      enable = true;
      # profiles.${config.hm.specialArgs.user-settings.username}.name = "${config.hm.specialArgs.user-settings.name}";
    };
  };
}
