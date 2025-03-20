{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./bash.nix
    ./zsh.nix
  ];

  config.nixos = lib.mkMerge [
    (lib.mkIf (systemSettings.shell == "bash") {
      bash = true;
    })
    (lib.mkIf (systemSettings.shell == "zsh") {
      zsh = true;
    })
  ];
}
