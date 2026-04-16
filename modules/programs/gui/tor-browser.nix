{inputs, ...}: {
  # Tor Browser is a privacy-focused browser that connects through the tor network

  flake.modules.homeManager.tor-browser = {pkgs, ...}: {
    home.packages = [pkgs.tor-browser];
  };
}
