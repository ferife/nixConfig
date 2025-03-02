{ config, lib, pkgs, inputs, ... }:
{
	options = {
		firefox.enable = lib.mkEnableOption "Installs & configures Firefox";
	};

	config = lib.mkIf config.firefox.enable {
		programs.firefox = {
      enable = true;
      nativeMessagingHosts = with pkgs; [ gnome-browser-connector ];  # Allows the GNOME shell and its extensions to interact with Firefox

      policies = {
        # To view all possible policies, go to Firefox and type about:policies#documentation

        CaptivePortal = false;          # Enable/Disable captie portal support
        DisableFirefoxAccounts = true;  # Disables account-based services, including sync
        DisableAccounts = true;         # Same as above
        DisableFirefoxStudies = true;   # Prevent Firefox from running studies
        DisableFormHistory = true;      # Don't remember search and form history
        DisablePocket = true;           # Disable the feature to save webpages to pockets
        DisableTelemetry = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
          EmailTracking = true;
        };
        DNSOverHTTPS = { Enabled = false; };
        NetworkPrediction = false;      # Enable/Disable network prediction (DNS prefetching)
        Permissions = { Autoplay = { Default = "block-audio-video"; }; };
        ExtensionSettings = {};
      };

      profiles.perpetuallyWeary = {

        isDefault = true;

        settings = { # To view all possible settings, go to firefox and type "about:config"
          # "dom.security.https_only_mode" = true;
          browser.newtabpage.activity-stream.showSponsoredTopSites = false;
        };

        bookmarks = [
          {
            name = "Doom Radio";
            url = "https://www.youtube.com/watch?v=JEuAYnjtJP0";
            keyword = "radio";
            tags = [ "Music" ];
            # toolbar = true;
          }
          {
            name = "Nix sites";
            # toolbar = true;
            bookmarks = [
              {
                name = "NixOS Search";
                url = "https://search.nixos.org/packages";
                tags = [ "nix" "search" ];
              }
              {
                name = "Home Manager Search";
                url = "https://home-manager-options.extranix.com";
              }
            ];
          }
        ];

        search = {
          default = "DuckDuckGo";
          force = true;

          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              # icon = "";
              definedAliases = [ "@np" ];
            };

          };
        };

        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [

          # 600% Sound Volume

          canvasblocker # Alters some JS APIs to prevent fingerprinting
          clearurls     # Remove tracking elements from URLs
          cookie-autodelete # When a tab closes, any cookies not being used are automatically deleted
              # Keep the ones you trust (forever/until restart) while deleting the rest. Containers Supported

          # Cookie Clicker Mod Manager

          decentraleyes # Protects against tracking through centralized content delivery platforms like Google

          # EPUBReader

          facebook-container  # Extension by Mozilla that isolates facebook activity for the sake of privacy
          gnome-shell-integration

          # Mullvad Browser Extension

          multi-account-containers  # Extension by Mozilla that separates website log-ins and tabs into color-coded containers
          omnivore

          # onetab

          # PassFF
            # Firefox extension for the Terminal-based pass password manager

          privacy-badger  # Blocks invisible trackers
          protondb-for-steam
          react-devtools
          read-aloud  # TTS
          reduxdevtools # Dev tools for React Redux
          return-youtube-dislikes
          shinigami-eyes  # Highlights transphobic vs trans-friendly stuff online
          sponsorblock
          temporary-containers  # Open tabs in auto managed disposable containers
          ublock-origin
          umatrix # Point-and-click based firewall, giving full control of which data goes in and out, and to where
              # Made by the dev of uBlock Origin
        ];
      };

    };
	};
}
