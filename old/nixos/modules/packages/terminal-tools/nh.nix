{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.nh.enable {
    nixos.scripts.gas.enable = true;

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

    environment.shellAliases = lib.mkIf config.nixos.nh.shellAliases {
      gas = "bash ${config.nixos.scripts.gas.full-path}";
    };
  };
  # NOTE: In order to ensure that changes here get applied, reboot after rebuilding
}
