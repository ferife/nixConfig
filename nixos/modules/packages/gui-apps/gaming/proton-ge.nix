{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.nixos.gaming.protonGe {
      environment.systemPackages = [pkgs.protonup];
      # NOTE: I've made some changes to the gas script, which allows it to detect whether protonup is installed and allowing it to update proton ge whenever steam is also being update

      environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${config.nixos.specialArgs.user-settings.username}/.steam/root/compatibilitytools.d";
      };
    })
  ];
}
