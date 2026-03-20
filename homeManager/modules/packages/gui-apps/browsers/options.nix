{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    chromium = mkEnableOption "Chromium";
    firefox = mkEnableOption "Firefox";
    floorp = mkEnableOption "Floorp";
    librewolf = mkEnableOption "LibreWolf, a privacy-focused Firefox-based browser";
    tor-browser = mkEnableOption "Tor Browser";

    # Firefox/Floorp Config
    ff-config = mkOption {
      type = lib.types.attrs;
      description = "The configuration that will be used by default with Firefox, Floorp, and any other Firefox-based browser";
    };
  };
}
