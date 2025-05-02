{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.lowPowerOptions {
    services.upower = {
      enable = true;

      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;

      criticalPowerAction = "Hibernate";
    };
  };
}
