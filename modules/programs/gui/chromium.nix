{inputs, ...}: {
  # Chromium is a chrome-based browser
  #
  # flake.modules.nixos.chromium = {pkgs, ...}: {};

  flake.modules.homeManager.chromium = {pkgs, ...}: {
    programs.chromium = {
      enable = true;
      # extensions = [
      #   # {id = "ddkjiahejlhfcafbddmgiahcphecmpfh";}
      #   # User-Agent Switcher plugin: https://chromewebstore.google.com/detail/user-agent-switcher/dbclpoekepcmadpkeaelmhiheolhjflj
      # ];
    };
    dconf.settings = {"org/gnome/shell".favorite-apps = ["chromium-browser.desktop"];};
  };
}
