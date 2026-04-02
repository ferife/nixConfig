{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.nixos.login-manager.name == "regreet") {
    services.greetd = {
      enable = true;
      settings.default_session = {
        # command = "cage -s -mlast -- regreet";
        # user = "greeter";
      };
    };

    programs.regreet = {
      enable = true;
      settings = {
        widget.clock = {
          format = "%T\n%A %B %e, %Y\nTime zone: %:V";
        };
      };
    };
  };
}
