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

  config = lib.mkMerge [
    (lib.mkIf (config.hm.specialArgs.system-settings.shell == "bash") {
      hm.bash = true;
    })
    (lib.mkIf (config.hm.specialArgs.system-settings.shell == "zsh") {
      hm.zsh = true;
    })
  ];
}
