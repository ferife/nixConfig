{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm.scripts = {
    gas = lib.mkEnableOption "gas, a shell script designed to make the process of updating my config simple";
    test = lib.mkEnableOption "the test of conditional concatenation of strings";
  };
}
