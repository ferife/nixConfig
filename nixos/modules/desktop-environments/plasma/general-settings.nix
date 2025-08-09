{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.nixos.specialArgs.system-settings.desktop-environment == "plasma") {
      nixos.login-manager.name = lib.mkForce "sddm";
    })

    (lib.mkIf config.nixos.plasma.enable {
      services = {
        desktopManager.plasma6.enable = true;
      };
    })
  ];
}
