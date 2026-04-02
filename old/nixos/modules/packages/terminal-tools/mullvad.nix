{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.mullvad {
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad; # Installs just CLI
      enableExcludeWrapper = true;
    };
    # networking.firewall.checkReversePath = "loose"; # Doen automatically by services.mullvad-vpn.enable = true;
  };
}
