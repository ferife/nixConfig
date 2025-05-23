{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.mullvadVpn {
    environment.systemPackages = with pkgs; [
      mullvad # CLI
      mullvad-vpn # GUI
    ];
    networking.wireguard.enable = true;
    services.mullvad-vpn.enable = true;
    # networking.firewall.checkReversePath = "loose"; # Doen automatically by services.mullvad-vpn.enable = true;
  };
  # TODO: Set a shell script that will auto log me in to my Mullvad account
  # REMEMBER that the account number should be set up as a secret
}
