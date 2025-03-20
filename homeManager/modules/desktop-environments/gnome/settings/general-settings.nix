{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.generalSettings {
    home.packages = with pkgs; [
      dconf-editor # Allows for the editing of GNOME settings in NixOS
      gnome-tweaks # Find the existence of hidden settings much more easily than with dconf editor
    ];

    dconf.settings = {
      "org/gnome/desktop/calendar" = {
        show-weekdate = true;
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
      };
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
      };

      "org/gnome/shell".disabled-extensions = [];
      # The line above makes it so that the list of disabled extensions is empty
      # Since the list of disabled extensions takes precedence over enabled extensions, letting it not be empty would sometimes cause extensions to not successfully enable
    };
  };
}
