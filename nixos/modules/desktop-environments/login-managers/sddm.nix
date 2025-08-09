{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.nixos.login-manager.name == "sddm") {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
    ];
  };
}
