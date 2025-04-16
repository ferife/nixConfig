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
    networking.firewall.checkReversePath = "loose";
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
    };
  };
  # TODO: Set a shell script that will auto log me in to my Mullvad account
}
