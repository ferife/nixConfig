{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.pass {
    programs.password-store = {
      enable = true;
    };
    home.packages = with pkgs; [
      passff-host # Required for the firefox extension to work
      python313   # Required for the firefox extension to work
    ];
    # Some extra dependency stuff in nixos/modules/packages/cli-tools/password-store.nix
  };
}
# FIXME: password-store
# TODO: Cancel ExpressVPN subscription
