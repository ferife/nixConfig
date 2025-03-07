{ config, lib, pkgs, systemSettings, ... }:
{
  imports = [
    ./bash.nix
    ./zsh.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (systemSettings.shell == "bash") {
      bash.hm.enable = true;
    })
    (lib.mkIf (systemSettings.shell == "zsh") {
      zsh.hm.enable = true;
    })
  ];
}
