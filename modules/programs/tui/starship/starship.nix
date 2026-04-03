{inputs, ...}: {
  # flake.modules.nixos.starship = {pkgs, ...}: {};

  flake.modules.homeManager.starship = {pkgs, ...}: {
    programs.starship = {
      enable = true;
      settings.shell = {
        disabled = false;

        bash_indicator = "bash";
        cmd_indicator = "cmd";
        elvish_indicator = "elvish";
        fish_indicator = "fish";
        ion_indicator = "ion";
        nu_indicator = "nu";
        powershell_indicator = "powershell";
        tcsh_indicator = "tcsh";
        xonsh_indicator = "xonsh";
        zsh_indicator = "zsh";
        unknown_indicator = "unknown";
      };
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableIonIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
  };
}
