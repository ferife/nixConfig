{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.zellij {
    programs.zellij = lib.mkMerge [
      {enable = true;}
      (lib.mkIf (config.hm.bash) {enableBashIntegration = true;})
      (lib.mkIf (config.hm.zsh) {enableZshIntegration = true;})
    ];
  };
}
