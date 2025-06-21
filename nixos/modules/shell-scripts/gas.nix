{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      nixos.scripts.gas = {
        source = let
          script-start = "#!/usr/bin/env bash\nreload_floorp_profile=\"${config.nixos.scripts.reload-floorp-profile.true-path}\"";
        in "${script-start}\n\n${builtins.readFile ../../../generalResources/scripts/gas.bash}";

        path = "${config.nixos.specialArgs.system-settings.scripts-dir}";
        true-path = "/etc/${config.nixos.scripts.gas.path}";
      };
    }
    (lib.mkIf config.nixos.scripts.gas.enable {
      nixos.scripts.reload-floorp-path.enable = true;

      # nixos.scripts.gas.source = let
      #   script-start = "#!/usr/bin/env bash\nreload_floorp_profile=\"${config.nixos.scripts.reload-floorp-profile.true-path}\"";
      # in "${script-start}\n\n${builtins.readFile ../../../generalResources/scripts/gas.bash}";

      environment = {
        # systemPackages = [pkgs.alejandra];

        # etc."blablabla" = {
        #   enable = true;
        #   text = "Testing";
        # };

        # shellAliases = {
        #   gas = "${config.nixos.scripts.gas.true-path}";
        # };
      };
    })
  ];
}
