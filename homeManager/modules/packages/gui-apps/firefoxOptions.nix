{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  config = {
    # The names of firefox profiles should be added to the list below for stylix to fully work on them
    stylix.targets.firefox.profileNames = ["perpetuallyWeary"];

    # programs.firefox.enableGnomeExtensions = true;
    programs.firefox.nativeMessagingHosts = with pkgs; [gnome-browser-connector]; # Allows the GNOME shell and its extensions to interact with Firefox
    programs.firefox.policies = {
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

    programs.firefox.profiles.perpetuallyWeary.name = "Perpetually Weary";
    programs.firefox.profiles.perpetuallyWeary.isDefault = true;
    programs.firefox.profiles.perpetuallyWeary.settings = {
      # To view all possible settings, go to firefox and type "about:config"
      browser.fixup.fallback-to-https = true;
      browser.newtabpage.activity-stream.showSponsoredTopSites = false;
    };
    programs.firefox.profiles.perpetuallyWeary.bookmarks = [
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
    programs.firefox.profiles.perpetuallyWeary.extensions = with inputs.firefox-addons.packages."${systemSettings.system}"; [
      # 600% Sound Volume

      canvasblocker # Alters some JS APIs to prevent fingerprinting
      clearurls # Remove tracking elements from URLs
      # cookie-autodelete # When a tab closes, any cookies not being used are automatically deleted
      # # Keep the ones you trust (forever/until restart) while deleting the rest. Containers Supported

      # Cookie Clicker Mod Manager

      decentraleyes # Protects against tracking through centralized content delivery platforms like Google

      # EPUBReader

      facebook-container # Extension by Mozilla that isolates facebook activity for the sake of privacy
      gnome-shell-integration

      # Mullvad Browser Extension

      multi-account-containers # Extension by Mozilla that separates website log-ins and tabs into color-coded containers
      omnivore

      # onetab

      privacy-badger # Blocks invisible trackers
      protondb-for-steam
      # react-devtools
      read-aloud # TTS
      # reduxdevtools # Dev tools for React Redux
      return-youtube-dislikes
      shinigami-eyes # Highlights transphobic vs trans-friendly stuff online
      sponsorblock
      temporary-containers # Open tabs in auto managed disposable containers
      ublock-origin
      # umatrix # Point-and-click based firewall, giving full control of which data goes in and out, and to where
      # Made by the dev of uBlock Origin
    ];
    programs.firefox.profiles.perpetuallyWeary.containersForce = true;
    programs.firefox.profiles.perpetuallyWeary.containers = {
      personal = {
        name = "Personal";
        color = "blue";
        icon = "fingerprint";
        id = 1;
      };
      school = {
        name = "School";
        color = "turquoise";
        icon = "fruit";
        id = 2;
      };
      work = {
        name = "Work";
        color = "orange";
        icon = "briefcase";
        id = 3;
      };
      banking = {
        name = "Banking";
        color = "green";
        icon = "dollar";
        id = 4;
      };
      shopping = {
        name = "Shopping";
        color = "pink";
        icon = "cart";
        id = 5;
      };
      private = {
        name = "Streaming Services";
        color = "yellow";
        icon = "chill";
        id = 6;
      };
      gaming = {
        name = "Gaming";
        color = "red";
        icon = "gift";
        id = 7;
      };
      facebook = {
        name = "Facebook";
        color = "toolbar";
        icon = "fence";
        id = 8;
      };
    };
    # programs.firefox.profiles.perpetuallyWeary.search = {
    #   force = true;
    #   default = "DuckDuckGo";
    #   privateDefault = "DuckDuckGo";
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
    #       iconUpdateURL = "https://wiki.nixos.org/favicon.png";
    #       updateInterval = 24 * 60 * 60 * 1000;
    #       definedAliases = ["@nw"];
    #     };

    #     "Bing".metaData.hidden = true;
    #     "Google".metaData.alias = "@g";
    #   };
    # };
  };
}
