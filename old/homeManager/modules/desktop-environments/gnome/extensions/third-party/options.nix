{
  config,
  lib,
  ...
}: {
  options.hm.gnome = {
    caffeine =
      lib.mkEnableOption "the Caffeine extension for GNOME, which prevents the computer from going to sleep";
    clipboardIndicator =
      lib.mkEnableOption "the Clipboard Indicator extension for GNOME, which shows a menu with the recent history of the clipboard";
    forge =
      lib.mkEnableOption "the Forge extension for GNOME, which allows for automatic window tiling";
    mediaControls =
      lib.mkEnableOption "the Media Controls extension for GNOME, which adds controls for audio to be controlled from the top bar";
    tilingShell =
      lib.mkEnableOption "the Tiling Shell extension for GNOME, which allows for automatic window tiling";
    weatherOClock =
      lib.mkEnableOption "the Weather OClock extension for GNOME, which displays the weather in the pill at the center of the top bar";
  };
}
