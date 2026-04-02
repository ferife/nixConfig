{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      nixos.scripts.reload-floorp-profile = {
        source = ../../../generalResources/scripts/reload-floorp-profile.bash;
        path = "${config.nixos.specialArgs.system-settings.scripts-dir}/reload-floorp-profile.bash";
        full-path = "/etc/${config.nixos.scripts.reload-floorp-profile.path}";
      };
    }
    (lib.mkIf config.nixos.scripts.reload-floorp-profile.enable {
      environment.etc."${config.nixos.scripts.reload-floorp-profile.path}" = {
        enable = true;
        user = "${config.nixos.specialArgs.user-settings.username}";
        source = config.nixos.scripts.reload-floorp-profile.source;
      };
    })
  ];
}
