{inputs, ...}: {
  # qutebrowser is a chromium-based browser designed around keyboard navigation

  flake.modules.homeManager.qutebrowser = {lib, ...}: {
    programs.qutebrowser = {
      enable = true;
      aliases = {
        "q" = "close";
        "qa" = "quit";
        "w" = "session-save";
        "wq" = "quit --save";
        "wqa" = "quit --save";
        "x" = "quit --save";
      };
      settings = {
        auto_save.session = true;
        content.cookies.accept = "never";
        editor.command = ["nvim" "-f" "{file}" "-c" "normal {line}G{column0}l"];
      };
    };
  };
}
