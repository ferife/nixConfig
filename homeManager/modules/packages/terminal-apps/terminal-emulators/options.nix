{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    kitty = mkEnableOption "Kitty, a terminal emulator that takes advantage of the GPU, can display images, and adds great customization";
    gnomeTerminal = mkEnableOption "the GNOME terminal emulator, which comes installed by default with the GNOME desktop environment";
    ghostty = mkEnableOption "Ghostty, a terminal emulator that supports the Kitty graphics protocol, and prides itself on requiring as little configuration as possible (while still allowing for configuration)";
  };
}
