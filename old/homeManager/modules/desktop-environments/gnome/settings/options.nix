{
  config,
  lib,
  ...
}: {
  options.hm.gnome = {
    generalSettings = lib.mkEnableOption "some basic settings for GNOME";
    laptopSettings = lib.mkEnableOption "certain GNOME settings that only make sense on laptops";
  };
}
