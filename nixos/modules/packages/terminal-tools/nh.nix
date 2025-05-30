{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  config = lib.mkIf config.nixos.nh.enable {
    environment.etc = {
      "nix-scripts/gas.bash" = {
        enable = true;
        user = "${userSettings.username}";
        source = ./shell-scripts/gas.bash;
      };
      "nix-scripts/reload-floorp-profile.bash" = {
        # Dependency for gas.bash
        enable = true;
        user = "${userSettings.username}";
        source = ./shell-scripts/reload-floorp-profile.bash;
      };
    };
    programs.nh = {
      enable = true;
      flake = systemSettings.flakePath;

      clean = lib.mkIf config.nixos.nh.autoClean {
        enable = true;
        dates = "weekly";
        extraArgs = "--ask --keep-since 7d --keep 10";
      };
    };

    environment.variables = {
      NIX_CONFIG_PATH = "${systemSettings.nixConfigPath}";
      FLAKE_HOSTNAME = "${systemSettings.hostname1}";
    };

    environment.shellAliases = lib.mkIf config.nixos.nh.shellAliases {
      gas = "bash /etc/nix-scripts/gas.bash";
    };
  };
  # NOTE: In order to ensure that changes here get applied, reboot after rebuilding
  # TODO: Make it so that if the nh cleanup is enabled, it forces the one that doesn't rely on nh to be false
}
