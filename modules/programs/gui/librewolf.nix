{inputs, ...}: {
  # Librewolf is a privacy-focused firefox-based browser

  flake.modules.homeManager.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
      profiles.fernandorf = {
        id = 0;
        name = "fernandorf";
        isDefault = true;
        containersForce = true;
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
                  url = "https://search.nixos.org/packages?channel=unstable";
                  tags = ["nix" "search"];
                }
                {
                  name = "Nix HM Search";
                  url = "https://home-manager-options.extranix.com/?query=&release=master";
                  tags = ["nix" "home manager" "search"];
                }
              ];
            }
          ];
        };
        # search = {};

        # extensions = [
        #   ublock origin
        #   firefox multi account containers
        #   temporary containers
        #   keepassxc-browser
        #   facebook container
        #   mullvad (installed through mullvad.net)
        #   tree-style tabs
        #   unhook
        # ];
      };
    };

    stylix.targets.librewolf.colorTheme.enable = true;
    dconf.settings."org/gnome/shell".favorite-apps = ["librewolf.desktop"];
  };
}
