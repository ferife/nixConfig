{inputs, ...}: {
  flake-file.inputs.noctalia = {
    url = "github:noctalia-dev/noctalia-shell";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  # flake.modules.nixos.noctalia = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia = {pkgs, ...}: {
    imports = [
      inputs.noctalia.homeModules.default
      inputs.self.modules.homeManager.noctalia-plugins
    ];

    programs.noctalia-shell.enable = true;
    wayland.windowManager.hyprland = {
      extraConfig = "exec-once = noctalia-shell";

      settings = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
        };

        decoration = {
          rounding = 20;
          rounding_power = 2;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
          };

          # blur = {
          #   enabled = true;
          #   size = 3;
          #   passes = 2;
          #   vibrancy = 0.1696;
          # };
        };
      };
    };
  };
}
