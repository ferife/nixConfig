{
  config,
  lib,
  pkgs,
  ...
}: {
  config.nixos = let
    mkTrue = lib.mkForce true;
    mkFalse = lib.mkForce false;
  in {
    # GUI
    # gaming.enable = mkFalse;
    #
    # Command tools
    # distrobox = mkTrue;
  };
}
