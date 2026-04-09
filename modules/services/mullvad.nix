{inputs, ...}: {
  # Mullvad is a VPN

  flake.modules.nixos.mullvad = {pkgs, ...}: {
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad; # CLI only
      # enableExcludeWrapper = true;
      enableEarlyBootBlocking = true; # Ensures mullvad boots before any network configuration is applied
    };
  };

  flake.modules.homeManager.mullvad = {pkgs, ...}: {
    programs.mullvad-vpn.enable = true;
    xdg.autostart.entries = ["${pkgs.mullvad-vpn}/share/applications/mullvad-vpn.desktop"];
    # dconf.settings = {"org/gnome/shell".favorite-apps = ["mullvad-vpn.desktop"];};
  };
}
