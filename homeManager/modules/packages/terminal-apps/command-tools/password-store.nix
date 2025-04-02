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

    home.file.passff-host-workaround = {
      # WARN: This is a dirty workaround done until Home Manager maintainers fix the issue
      target = "${config.home.homeDirectory}/.mozilla/native-messaging-hosts/passff.json";
      source = "${pkgs.passff-host}/share/passff-host/passff.json";
    };

    home.packages = with pkgs; [
      # NOTE: The following packages are only really necessary for setting up password-store for ios and firefox. Once that's done, I don't need them anymore
      # qrencode # Library for encoding data into a QR code, used to transfer public & private keys safely
      # imagemagick # Image file manipulation, used here to convert PNGs to GIF
    ];

    # Sync passwords whenever shell gets (re)initialized
    programs.bash.initExtra = lib.mkIf (config.hm.bash) "pass git pull origin main";
    programs.zsh.initExtra = lib.mkIf (config.hm.zsh) "pass git pull origin main";
  };
  # WARN: Apparently GPG and pass use shitty, deprecated encryption methods (see the YT video on this by Spectra Secure)
  # TODO: Replace pass with KeePassXC AS SOON AS POSSIBLE
  # TODO: Cancel ExpressVPN subscription
  # TODO: Also set up pass-otp (github:tadfisher/pass-otp)
  # NOTE: To sync this with the iphone app, I need to set the URL for the git repo to `ssh://git@github.com/<username>/<repo name>.git`, set the branch name, set the username to `git`, and use the SSH key to log in
}
