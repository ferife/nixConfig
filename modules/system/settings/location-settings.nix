{inputs, ...}: {
  flake.modules.nixos.location-settings = {pkgs, ...}: let
    timezone = "America/Chicago";
    locale = "en_US.UTF-8";
  in {
    time.timeZone = "${timezone}";

    # Select internationalisation properties.
    i18n.defaultLocale = "${locale}";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "${locale}";
      LC_IDENTIFICATION = "${locale}";
      LC_MEASUREMENT = "${locale}";
      LC_MONETARY = "${locale}";
      LC_NAME = "${locale}";
      LC_NUMERIC = "${locale}";
      LC_PAPER = "${locale}";
      LC_TELEPHONE = "${locale}";
      LC_TIME = "${locale}";
    };
  };
}
