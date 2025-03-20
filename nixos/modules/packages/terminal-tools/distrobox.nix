{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.distrobox {
    environment.systemPackages = with pkgs; [
      distrobox
    ];

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
