{inputs, ...}: {
  # Regreet is a login manager made to work with a variety of desktop environments and window managers

  flake.modules.nixos.regreet = {pkgs, ...}: {
    services.greetd.enable = true;

    programs.regreet = {
      enable = true;
      settings.widget.clock.format = "%T\n%A %B %e, %Y\nTime zone: %:V";
    };
  };
}
