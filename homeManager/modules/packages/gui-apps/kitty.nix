{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.kitty {programs.kitty.enable = true;})

    # (lib.mkIf (config.hm.specialArgs.user-settings.colorscheme == "onedark") {
    #   stylix.targets.kitty.enable = false;
    #   programs.kitty.themeFile = "OneDark";
    # })

    {
      programs.kitty = {
        settings.background_opacity = lib.mkForce 0.9;
        font = lib.mkForce {
          name = config.hm.specialArgs.user-settings.font.name;
          package = config.hm.specialArgs.user-settings.font.package;
          size = 12;
        };
      };
    }

    (lib.mkIf config.hm.bash {programs.kitty.shellIntegration.enableBashIntegration = true;})
    (lib.mkIf config.hm.zsh {programs.kitty.shellIntegration.enableZshIntegration = true;})

    # (lib.mkIf (config.hm.kitty && config.hm.gnome.enable) {
    (lib.mkIf ((config.hm.specialArgs.user-settings.terminal == "kitty") && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["kitty.desktop"];};
    })
  ];
  # NOTE: To search through command history in the terminal using kitty, simply use CTRL+R
}
