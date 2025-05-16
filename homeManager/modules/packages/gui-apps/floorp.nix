{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  config = lib.mkIf config.hm.floorp {
    # Go to ./firefox-options-(un)stable.nix for the firefox hm options

    programs.floorp = config.hm.ff-config;
    stylix.targets.floorp.profileNames = config.stylix.targets.firefox.profileNames;
  };
  # find ~ -path ~/Documents -prune -o -iname '*floorp*' -print
  # find ~ -path ~/Documents -prune -o -iname '*floorp*' -exec rm -rf {} +
}
