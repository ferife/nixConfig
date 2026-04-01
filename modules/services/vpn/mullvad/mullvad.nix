{inputs, ...}: {
  flake.modules.nixos.mullvad = {pkgs, ...}: {
    networking.wireguard.enable = true;
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad;
      enableExcludeWrapper = true;
    };
  };

  flake.modules.homeManager.mullvad = {pkgs, ...}: {
    programs.mullvad-vpn.enable = true;
    xdg.autostart.entries = ["${pkgs.mullvad-vpn}/share/applications/mullvad-vpn.desktop"];
    # dconf.settings = {"org/gnome/shell".favorite-apps = ["mullvad-vpn.desktop"];};
  };
}
