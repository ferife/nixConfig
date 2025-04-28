{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.kitty {programs.kitty.enable = true;})

    (lib.mkIf (config.hm.stylix.theme == "onedark") {
      stylix.targets.kitty.enable = false;
      programs.kitty.themeFile = "OneDark";
    })

    {
      programs.kitty = {
        settings.background_opacity = lib.mkForce 0.9;
        font = lib.mkForce {
          name = "Fira Code";
          package = pkgs.fira-code;
          size = 12;
        };
      };
    }

    (lib.mkIf config.hm.bash {programs.kitty.shellIntegration.enableBashIntegration = true;})
    (lib.mkIf config.hm.zsh {programs.kitty.shellIntegration.enableZshIntegration = true;})
  ];
  # NOTE: To search through command history in the terminal using stylix, simply use CTRL+R
}
