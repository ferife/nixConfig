{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.astal {
    home.packages = [inputs.astal.packages.${system}.default];
  };
}
