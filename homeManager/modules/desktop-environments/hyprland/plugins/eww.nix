{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.eww {
    programs.eww = lib.mkMerge [
      {
        enable = true;
        configDir = ./ewwConfig;
      }
      (lib.mkIf config.hm.bash {enableBashIntegration = true;})
      (lib.mkIf config.hm.zsh {enableZshIntegration = true;})
    ];
  };
}
