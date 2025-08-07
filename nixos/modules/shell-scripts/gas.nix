{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      nixos.scripts.gas = {
        source = ../../../generalResources/scripts/gas.bash;
        path = "${config.nixos.specialArgs.system-settings.scripts-dir}/gas.bash";
        full-path = "/etc/${config.nixos.scripts.gas.path}";
      };

      nixos.scripts.reload-floorp-profile.enable = config.nixos.scripts.gas.enable;
    }
    (lib.mkIf config.nixos.scripts.gas.enable {
      environment.etc."${config.nixos.scripts.gas.path}" = {
        enable = true;
        user = "${config.nixos.specialArgs.user-settings.username}";
        source = config.nixos.scripts.gas.source;
      };
    })
  ];
}
