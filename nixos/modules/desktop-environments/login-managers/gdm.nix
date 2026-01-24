{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.nixos.login-manager.name == "gdm") {
    services.displayManager.gdm.enable = true;

    environment.systemPackages = with pkgs; [
      gdm-settings
    ];
  };
}
