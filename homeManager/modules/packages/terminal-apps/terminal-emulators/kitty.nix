{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.kitty {
    programs.kitty = lib.mkMerge [
      {
        enable = true;
        settings.background_opacity = lib.mkForce 0.9;
      }

      (lib.mkIf config.hm.bash {shellIntegration.enableBashIntegration = true;})
      (lib.mkIf config.hm.zsh {shellIntegration.enableZshIntegration = true;})
    ];
  };
  # TODO: Customize font
  # To search through command history in the terminal using stylix, simply use CTRL+R
}
