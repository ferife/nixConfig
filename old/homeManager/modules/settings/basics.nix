{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    # Check for release version mismatch between Home Manager and Nixpkgs
    home.enableNixpkgsReleaseCheck = true;
  };
}
