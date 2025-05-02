{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.hm.torBrowser {
    home.packages = with pkgs-unstable; [
      tor-browser
    ];

    # services.tor = {
    #   enable = true;
    # };
  };
}
