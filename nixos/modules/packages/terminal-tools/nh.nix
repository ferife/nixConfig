{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.nh.enable {
    programs.nh = {
      enable = true;
      flake = config.nixos.specialArgs.system-settings.flake-path;

      clean = lib.mkIf config.nixos.nh.autoClean {
        enable = true;
        dates = "weekly";
        extraArgs = "--ask --keep-since 7d --keep 10";
      };
    };

    environment.variables = {
      NIX_CONFIG_PATH = "${config.nixos.specialArgs.system-settings.config-path}";
      FLAKE_HOSTNAME = "${config.nixos.specialArgs.system-settings.hostname}";
    };

    nixos.scripts.gas.enable = true;
  };
  # NOTE: In order to ensure that changes here get applied, reboot after rebuilding
  # TODO: Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false
}
