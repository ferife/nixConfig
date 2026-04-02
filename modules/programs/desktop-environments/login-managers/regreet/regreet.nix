{inputs, ...}: {
  flake.modules.nixos.regreet = {pkgs, ...}: {
    services.greetd.enable = true;

    programs.regreet = {
      enable = true;
      settings.widget.clock.format = "%T\n%A %B %e, %Y\nTime zone: %:V";
    };
  };

  # flake.modules.homeManager.regreet = {pkgs, ...}: {};
}
