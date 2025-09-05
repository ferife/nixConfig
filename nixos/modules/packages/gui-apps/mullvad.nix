{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.mullvadVpn {
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn; # Installs both CLI and GUI
      enableExcludeWrapper = true;
    };
    # networking.firewall.checkReversePath = "loose"; # Doen automatically by services.mullvad-vpn.enable = true;
  };
}
