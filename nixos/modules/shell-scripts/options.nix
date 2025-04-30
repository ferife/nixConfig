{
  config,
  lib,
  ...
}: {
  options.nixos.scripts = {
    gas = lib.mkEnableOption "gas, a shell script designed to make the process of updating my config simple";
  };
}
