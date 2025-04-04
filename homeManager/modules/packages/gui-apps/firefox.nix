{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.firefox {
    # Go to ./firefoxOptions.nix for the firefox hm options
    programs.firefox.enable = true;
  };
}
