{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.eza) {
      programs.eza.enable = true;
      home.shellAliases = {
        "eza" = "eza --icons --group-directories-first";
        "exa" = "eza --icons --group-directories-first";
      };
    })

    # Avoid clashing with lsd aliases
    (lib.mkIf (config.hm.eza) {
      # Logic for aliases:
      #   Everything has --icons
      #   Trees are --group-directories-last
      #     Everything else is --group-directories-first
      #   Alls that are also trees have --ignore-glob=".git"
      #   Longs have `--header --git --total-size`
      #     I may want to remove --total-size if execution on large directories is a problem
      home.shellAliases = {
        "ls" = "eza --icons --group-directories-first";
        "la" = "eza --icons --group-directories-first --all";
        "ll" = "eza --icons --group-directories-first --long --header --git --total-size";
        "lla" = "eza --icons --group-directories-first --long --header --git --total-size --all";
        "lt" = "eza --icons --tree --group-directories-last";
        "llt" = "eza --icons --tree --group-directories-last --long --header --git --total-size";
        "llta" = "eza --icons --tree --group-directories-last --long --header --git --total-size --all --ignore-glob=\".git\"";
      };
    })

    # Bash
    (lib.mkIf (config.hm.eza && config.hm.bash) {programs.eza.enableBashIntegration = true;})

    # Zsh
    (lib.mkIf (config.hm.eza && config.hm.zsh) {programs.eza.enableZshIntegration = true;})
  ];
}
