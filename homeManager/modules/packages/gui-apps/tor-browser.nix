{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.torBrowser {
    home.packages = with pkgs; [
      tor-browser
    ];

    # services.tor = {
    #   enable = true;
    # };
  };
}
