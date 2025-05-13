{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  config = lib.mkIf config.hm.floorp {
    # Go to ./firefoxOptions.nix for the firefox hm options

    programs.floorp.enable = true;
    stylix.targets.floorp.profileNames = config.stylix.targets.firefox.profileNames;
    # programs.floorp.enableGnomeExtensions = config.programs.firefox.enableGnomeExtensions;
    programs.floorp.nativeMessagingHosts = config.programs.firefox.nativeMessagingHosts;
    programs.floorp.policies = config.programs.firefox.policies;
    programs.floorp.profiles = config.programs.firefox.profiles;

    # Settings
    #
    # Enable sleeping tabs - Tabs will slep after being inactive for [30] minutes
    # Play DRM-controlled content
    # Always underline links
    # Multi-Row Tab Bar
    # Display tab bar underneath the Toolbar
    # Browser Manager Sidebar
    #   Browser Manager
    #   Bookmarks
    #   History
    #   Downloads
    #   Notes
    #   proton mail inbox (open in personal container)
    #   github:ferife/nixConfig (open in personal container)
    #   docs.floorp.app (open in personal container)
    #   Tree Style Tab
    # Manage workspace on Browser Manager Sidebar
    # Shortcuts - (2 rows)
    #   Sponsored shortcuts (off)
    # Recent Activity - (1 row)
    # Default Search Engine - DuckDuckGo (use this search engine in private windows)
    # Tell websites not to sell or share my data
    # Send websites a "Do Not Track" request
    # (Turn off all password options)
    # (Turn off all autofill options)
  };
}
