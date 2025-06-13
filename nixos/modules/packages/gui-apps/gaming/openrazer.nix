{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.gaming.openrazer {
    hardware.openrazer = {
      enable = true;
      users = [
        "${config.nixos.specialArgs.user-settings.username}"
      ];
    };

    environment.systemPackages = with pkgs; [
      openrazer-daemon # self-explanatory
      polychromatic # front-end for controlling Razer peripheral LEDs
    ];
  };
}
