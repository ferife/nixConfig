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
        true-path = "/etc/${config.nixos.scripts.reload-floorp-profile.path}";
      };

      # environment.etc."${config.nixos.scripts.reload-floorp-profile.path}" = {
      environment.etc."bla" = {
        # enable = config.nixos.scripts.reload-floorp-profile.enable;
        enable = true;
        # source = config.nixos.scripts.reload-floorp-profile.source;
        source = ../../../generalResources/scripts/reload-floorp-profile.bash;
      };
    }

    (lib.mkIf config.nixos.scripts.reload-floorp-profile.enable {
      })
  ];
}
