{
  config,
  lib,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.hm.audacity {
    home.packages = [pkgs-unstable.audacity];
  };
}
