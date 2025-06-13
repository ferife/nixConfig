{
  config,
  lib,
  pkgs,
  ...
}: let
  gas-path = "${config.nixos.specialArgs.system-settings.scripts-dir}/gas.bash";
  reload-floorp-path = "${config.nixos.specialArgs.system-settings.scripts-dir}/reload-floorp-profile.bash";
in {
  config = lib.mkIf config.nixos.nh.enable {
    environment.etc = {
      "${gas-path}" = {
        enable = true;
        user = "${config.nixos.specialArgs.user-settings.username}";
        source = ./shell-scripts/gas.bash;
      };
      "${reload-floorp-path}" = {
        # Dependency for gas.bash
        enable = true;
        user = "${config.nixos.specialArgs.user-settings.username}";
        source = ./shell-scripts/reload-floorp-profile.bash;
      };
    };
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
      gas = "bash /etc/${gas-path}";
    };
  };
  # NOTE: In order to ensure that changes here get applied, reboot after rebuilding
  # TODO: Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false
}
