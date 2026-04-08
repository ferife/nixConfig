{
  inputs,
  lib,
  ...
}: {
  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "fernandorf";

  flake.modules = lib.mkMerge [
    (inputs.self.factory.user "fernandorf" true)
    {
      nixos.fernandorf = {
        imports = with inputs.self.modules.nixos; [
          # developmentEnvironment
        ];
        users.users.fernandorf = {
          group = "audio";
        };
      };

      # darwin.fernandorf = {
      #   imports = with inputs.self.modules.darwin; [
      #     # drawingApps
      #     # developmentEnvironment
      #   ];
      # };

      homeManager.fernandorf = {pkgs, ...}: {
        imports = with inputs.self.modules.homeManager; [
          # home manager modules imported here
          system-desktop
          chromium
        ];
        home.packages = [pkgs.mediainfo];
      };
    }
  ];
}
