{
  config,
  lib,
  pkgs-stable,
  ...
}: {
  config = lib.mkIf config.hm.audacity {
    home.packages = [pkgs-stable.audacity];
  };
}
