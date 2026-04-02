{
  config,
  lib,
  ...
}: {
  options.nixos = {
    gnome-console = lib.mkEnableOption "the default console for GNOME";
  };
}
