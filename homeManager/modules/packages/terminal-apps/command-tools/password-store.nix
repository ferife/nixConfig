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

    # Some extra dependency stuff in nixos/modules/packages/cli-tools/password-store.nix

    home.file.passff-host-workaround = {
      # WARN: This is a dirty workaround done until Home Manager maintainers fix the issue
      target = "${config.home.homeDirectory}/.mozilla/native-messaging-hosts/passff.json";
      source = "${pkgs.passff-host}/share/passff-host/passff.json";
    };
  };
  # TODO: Cancel ExpressVPN subscription
  # TODO: Set up pass with ios app
  # TODO: Also set up pass-otp (github:tadfisher/pass-otp)
  # The zbarimg is a command tool that can read images for QR codes and spit out the URLs they lead to
}
