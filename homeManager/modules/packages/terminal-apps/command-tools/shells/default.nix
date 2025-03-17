{ config, lib, pkgs, systemSettings, ... }:
{
  imports = [
    ./options.nix

    ./bash.nix
    ./zsh.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (systemSettings.shell == "bash") {
      hm.bash = true;
    })
    (lib.mkIf (systemSettings.shell == "zsh") {
      hm.zsh = true;
    })
  ];
}
