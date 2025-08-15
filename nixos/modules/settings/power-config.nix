{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.power-config {
    services.tlp.enable = lib.mkIf (!config.nixos.gnome.enable) true;
    # services.upower = {
    #   enable = true;

    #   percentageLow = 20;
    #   percentageCritical = 5;
    #   percentageAction = 3;

    #   criticalPowerAction = "Hibernate";
    # };
    # WARN: It is best to never manually enable power-profiles-daemon. It conflicts with TLP, which manages power automatically and with more effectiveness
    # services.power-profiles-daemon.enable = false;
  };
}
