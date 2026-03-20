{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./chromium.nix
    ./firefox.nix
    ./firefox-options.nix
    ./floorp.nix
    ./librewolf.nix
    ./tor-browser.nix
  ];

  hm = {
    # chromium = lib.mkDefault false;
    firefox = lib.mkIf (config.hm.specialArgs.user-settings.browser == "firefox") true;
    floorp = lib.mkIf (config.hm.specialArgs.user-settings.browser == "floorp") true;
    librewolf = lib.mkIf (config.hm.specialArgs.user-settings.browser == "librewolf") true;
    tor-browser = lib.mkDefault true;
  };
}
