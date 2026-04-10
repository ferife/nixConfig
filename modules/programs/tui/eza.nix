{inputs, ...}: {
  # eza is a tool for listing directory contents
  #
  # flake.modules.nixos.eza = {pkgs, ...}: {};

  flake.modules.homeManager.eza = {lib, ...}: {
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      git = true;
    };

    home.shellAliases = {
      # eza = lib.mkForce "eza --icons --group-directories-first";
      exa = "eza --icons --group-directories-first";

      # Logic for aliases:
      #   Everything has --icons
      #   Trees are --group-directories-last
      #     Everything else is --group-directories-first
      #   Alls that are also trees have --ignore-glob=".git"
      #   Longs have --header --total-size
      #     I may want to remove --total-size if execution on large directories is a problem
      ls = "eza --icons --group-directories-first";
      la = "eza --icons --group-directories-first --all --ignore-glob=\".git\"";
      ll = "eza --icons --group-directories-first --long --header --total-size ";
      lla = "eza --icons --group-directories-first --long --header --total-size --all --ignore-glob=\".git\"";
      lt = "eza --icons --tree --group-directories-last";
      llt = "eza --icons --tree --group-directories-last --long --header --total-size";
      llta = "eza --icons --tree --group-directories-last --long --header --total-size --all --ignore-glob=\".git\"";
    };
  };
}
