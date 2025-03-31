{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.pass {
    programs.password-store = {
      enable = true;
    };
    home.packages = with pkgs; [
      passff-host # Required for the firefox extension to work
      python313 # Required for the firefox extension to work
    ];
    # Some extra dependency stuff in nixos/modules/packages/cli-tools/password-store.nix
  };
}
# TODO: Cancel ExpressVPN subscription
# TODO: Set up pass with firefox extension and ios app

# TODO: Also set up pass-otp (github:tadfisher/pass-otp)

# The zbarimg is a command tool that can read images for QR codes and spit out the URLs they lead to
