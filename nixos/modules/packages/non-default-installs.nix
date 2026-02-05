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
    android-studio = mkTrue;
    gaming.enable = mkFalse;
    #
    # Command tools
    # distrobox = mkTrue;
  };
}
