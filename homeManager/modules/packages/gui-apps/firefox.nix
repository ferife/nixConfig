{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.firefox {
    # Go to ./firefox-options-(un)stable.nix for the firefox hm options
    programs.firefox = config.hm.ff-config;
  };
}
