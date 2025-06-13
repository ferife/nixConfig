{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.ghostty {
      programs.ghostty = {
        enable = true;
        clearDefaultKeybinds = true;
        settings.keybind = [
          "ctrl+shift+i=inspector:toggle"
          "ctrl+shift+v=paste_from_clipboard"
          "ctrl+zero=reset_font_size"

          "ctrl+left=adjust_selection:left"
          "ctrl+down=adjust_selection:down"
          "ctrl+up=adjust_selection:up"
          "ctrl+right=adjust_selection:right"
        ];
      };
    })

    (lib.mkIf (config.hm.ghostty && config.hm.bash) {programs.ghostty.enableBashIntegration = true;})
    (lib.mkIf (config.hm.ghostty && config.hm.zsh) {programs.ghostty.enableZshIntegration = true;})
  ];
}
