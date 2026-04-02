{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.zsh {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}
