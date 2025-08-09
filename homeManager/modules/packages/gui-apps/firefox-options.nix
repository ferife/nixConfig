{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = {
    # The names of firefox profiles should be added to the list below for stylix to fully work on them
    stylix.targets.firefox = {
      colorTheme.enable = true;
      profileNames = ["perpetuallyWeary"];
    };

    hm.ff-config = {
      enable = true;
      # enableGnomeExtensions = true;
      nativeMessagingHosts = with pkgs; [gnome-browser-connector]; # Allows the GNOME shell and its extensions to interact with Firefox

      policies = {
        # To view all possible policies, go to Firefox and type about:policies#documentation

        CaptivePortal = false; # Enable/Disable captie portal support
        DisableFirefoxAccounts = true; # Disables account-based services, including sync
        DisableAccounts = true; # Same as above
        DisableFirefoxStudies = true; # Prevent Firefox from running studies
        DisableFormHistory = true; # Don't remember search and form history
        DisablePocket = true; # Disable the feature to save webpages to pockets
        DisableTelemetry = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
          EmailTracking = true;
        };
        DNSOverHTTPS = {Enabled = false;};
        NetworkPrediction = false; # Enable/Disable network prediction (DNS prefetching)
        Permissions = {Autoplay = {Default = "block-audio-video";};};
        ExtensionSettings = {};
      };

      profiles.perpetuallyWeary = {
        id = 0;
        name = "Perpetually Weary";
        isDefault = true;

        # Settings
        settings = {
          # To view all possible settings, go to firefox and type "about:config"
          browser.fixup.fallback-to-https = true;
          browser.newtabpage.activity-stream.showSponsoredTopSites = false;
        };
        extensions.force = true;

        # Bookmarks
        bookmarks = {
          force = true;
          settings = [
            {
              name = "Toolbar sites";
              toolbar = true;
              bookmarks = [
                {
                  name = "Doom Radio";
                  url = "https://www.youtube.com/watch?v=JEuAYnjtJP0";
                  keyword = "radio";
                  tags = ["music"];
                }
                {
                  name = "NixOS Search";
                  url = "https://search.nixos.org/packages";
                  tags = ["nix" "search"];
                }
                {
                  name = "Home Manager Search";
                  url = "https://home-manager-options.extranix.com";
                  tags = ["nix" "home manager" "search"];
                }
                {
                  name = "School Dashboard";
                  url = "https://utsa.instructure.com";
                  tags = ["school"];
                }
              ];
            }
          ];
        };

        # Containers
        containersForce = true;
        containers = {
          personal = {
            id = 1;
            name = "Personal";
            color = "blue";
            icon = "fingerprint";
          };
          school = {
            id = 2;
            name = "School";
            color = "turquoise";
            icon = "fruit";
          };
          work = {
            id = 3;
            name = "Work";
            color = "orange";
            icon = "briefcase";
          };
          banking = {
            id = 4;
            name = "Banking";
            color = "green";
            icon = "dollar";
          };
          shopping = {
            id = 5;
            name = "Shopping";
            color = "pink";
            icon = "cart";
          };
          private = {
            id = 6;
            name = "Streaming Services";
            color = "yellow";
            icon = "chill";
          };
          gaming = {
            id = 7;
            name = "Gaming";
            color = "red";
            icon = "gift";
          };
          facebook = {
            id = 8;
            name = "Facebook";
            color = "toolbar";
            icon = "fence";
          };
        };

        # Search
        # search = {
        #   force = true;
        #   default = "ddg";
        #   privateDefault = "ddg";
        #   engines = {
        #     "Nix Packages" = {
        #       urls = [
        #         {
        #           template = "https://search.nixos.org/packages";
        #           params = [
        #             {
        #               name = "type";
        #               value = "packages";
        #             }
        #             {
        #               name = "query";
        #               value = "{searchTerms}";
        #             }
        #           ];
        #         }
        #       ];
        #       icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        #       definedAliases = ["@np"];
        #     };
        #     "NixOS Wiki" = {
        #       urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
        #       icon = "https://wiki.nixos.org/favicon.png";
        #       updateInterval = 24 * 60 * 60 * 1000;
        #       definedAliases = ["@nw"];
        #     };
        #     "bing".metaData.hidden = true;
        #     "google".metaData.alias = "@g";
        #   };
        # };
        #
        # Extensions
        # extensions = [
        #   600% Sound Volume
        #   Canvas Blocker
        #   Clear URLs
        #   Cookie Autodelete
        #   Cookie Clicker Mod Manager
        #   DeArrow (crowdsourced un-clickbaited YT thumbnails and titles)
        #   Decentraleyes
        #   Facebook Container
        #   Firefox Multi-Account Containers
        #   Forest Pomodoro Timer
        #   Gnome Shell Integration
        #   KeePassXC Browser Extension
        #   Mullvad Browser Extension (installed directly through mullvad.net)
        #   Omnivore
        #   Privacy Badger
        #   ProtonDB for Steam
        #   React Developer Tools
        #   Read Allowed (TTS)
        #   Redux Dev Tools (Used for React Redux)
        #   Search by Image
        #   Shinigami Eyes
        #   Sponsorblock
        #   Temporary Containers
        #   Tree-Style Tabs
        #   uBlock Origin
        #   uMatrix (point-and-click based firewall made by the dev of uBlock Origin)
        #   Unhook (hide annoying stuff on youtube)
        #   Vimium
        # ];
        #
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
        # Firefox Home Content
        #   Shortcuts - (2 rows)
        #     Sponsored shortcuts (off)
        #   Recent Activity - (1 row)
        # Default Search Engine - DuckDuckGo (use this search engine in private windows)
        # Tell websites not to sell or share my data
        # Send websites a "Do Not Track" request
        # (Turn off all password options)
        # (Turn off all autofill options)
        # Turn on auto update for extensions
      };
    };
  };
}
