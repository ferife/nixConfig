{ config, lib, ... }: {
  options.hm.gnome = {
    appsMenu
      = lib.mkEnableOption "the Apps Menu extension for GNOME, which lets the user open applications from a menu divided by categories in the left side of the top bar";
    autoMoveWindows
      = lib.mkEnableOption "the Auto Move Windows extension for GNOME, which lets the user assign each application a default workspace to open its windows in";
    driveMenu
      = lib.mkEnableOption "the Removable Drive Menu extension for GNOME, which shows a status menu for rapid unmount and power off of external storage devices (i.e. USB drives)";
    launchNewInstance
      = lib.mkEnableOption "the Launch New Instance extension for GNOME, which forces app icons to always launch a new instance of the app instead of focusing on an existing window of the app";
    lightStyle
      = lib.mkEnableOption "the Light Style extension for GNOME, which changes the default shell style to \"light\", while still following the system-wide \"dark\" preference";
    nativeWindowPlacement
      = lib.mkEnableOption "the Native Window Placement extension for GNOME, which will lay out the thumbnails of the windows in a way that more accurately reflect their current positions on the screen";
    placesMenu
      = lib.mkEnableOption "the Places Menu extension for GNOME, which lets the user open the file explorer to certain directories from a menu in the left side of the top bar";
    screenshotWindowSizer
      = lib.mkEnableOption "the Screenshot Window Sizer extension for gnime, which lets the user resize windows for screenshots using CTRL+ALT+S";
    statusIcons
      = lib.mkEnableOption "the Status Icons extension for GNOME, which shows special status icons in the top bar for certain applications";
    systemMonitor
      = lib.mkEnableOption "the System Monitor extension for GNOME, which shows system usage information in the right side of the top bar";
    userTheme
      = lib.mkEnableOption "the User Themes extension for GNOME, which loads a shell theme from XDG_DATA_HOME/themes/<name>/gnome-shell";
    windowList
      = lib.mkEnableOption "the Window List extension for GNOME, which shows all open windows in the current workspace in a bar across the bottom of the screen";
    windowsNavigator
      = lib.mkEnableOption "the Windows Navigator extension for GNOME, which lets the user use the keyboard to select windows and workspaces in overlay mode";
    workspaceIndicator
      = lib.mkEnableOption "the Workspace Indicator extension for GNOME, which adds a workspace switcher to the top bar";
  };
}
