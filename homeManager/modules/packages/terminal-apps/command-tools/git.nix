{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.git {
    programs.git = lib.mkMerge [
      {enable = true;}

      (lib.mkIf (config.hm.specialArgs.system-settings.nixpkgs == "unstable") {
        settings = {
          user = {
            email = "github.backtrack434@passmail.net";
            name = "Fernando RF";
          };
        };
      })
      (lib.mkIf (config.hm.specialArgs.system-settings.nixpkgs == "25.05") {
        userEmail = "github.backtrack434@passmail.net";
        userName = "Fernando RF";
      })
    ];
  };
}
