{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.nixos.login-manager.name == "gdm") {
    services.displayManager.gdm.enable = true; # FIXME: Unstable

    environment.systemPackages = with pkgs; [
      gdm-settings
    ];
  };
}
