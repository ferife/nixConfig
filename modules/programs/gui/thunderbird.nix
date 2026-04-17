{inputs, ...}: {
  # Thunderbird is an email client

  flake.modules.homeManager.thunderbird = {pkgs, ...}: {
    programs.thunderbird.enable = true;

    # Add support for proton mail
    home.packages = [
      pkgs.protonmail-bridge
      pkgs.protonmail-bridge-gui
    ];
  };
}
