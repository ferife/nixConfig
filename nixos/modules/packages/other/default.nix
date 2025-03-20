{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./mullvad-vpn.nix
  ];

  firefoxNixosModule.enable = lib.mkDefault true;
  mullvadVpnModule.enable = lib.mkDefault true;
}
