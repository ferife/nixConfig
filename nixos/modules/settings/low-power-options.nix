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
    # TODO: Set up actions for the computer to use when the battery is running low
    # Use the NIXOS Options that exist for services.upower
    # Ensure that these action take into account whether the battery is charging or not
  };
}
