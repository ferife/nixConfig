{inputs, ...}: {
  # Thunderbird is an email client

  flake.modules.homeManager.thunderbird = {pkgs, ...}: {
    programs.thunderbird = {
      enable = true;
    };
  };
}
