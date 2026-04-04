{
  self,
  lib,
  ...
}: {
  flake.modules = lib.mkMerge [
    (self.factory.user "fernandorf" true)
    {
      nixos.fernandorf = {
        imports = with self.modules.nixos; [
          # developmentEnvironment
        ];
        users.users.fernandorf = {
          group = "audio";
        };
      };

      # darwin.fernandorf = {
      #   imports = with self.modules.darwin; [
      #     # drawingApps
      #     # developmentEnvironment
      #   ];
      # };

      homeManager.fernandorf = {pkgs, ...}: {
        imports = with self.modules.homeManager; [
          # home manager modules imported here
          system-desktop
          chromium
        ];
        home.packages = [pkgs.mediainfo];
      };
    }
  ];
}
