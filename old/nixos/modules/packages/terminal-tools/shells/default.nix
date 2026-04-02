{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./bash.nix
    ./zsh.nix
  ];

  config.nixos = lib.mkMerge [
    (lib.mkIf (config.nixos.specialArgs.system-settings.shell == "bash") {
      bash = true;
    })
    (lib.mkIf (config.nixos.specialArgs.system-settings.shell == "zsh") {
      zsh = true;
    })
  ];
}
