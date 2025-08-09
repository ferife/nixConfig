{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.nixos.login-manager.name == "gdm") {
    services.xserver.displayManager.gdm.enable = true; # FIXME: 25.05

    environment.systemPackages = with pkgs; [
      gdm-settings
    ];
  };
}
