{inputs, ...}: {
  # yazi is a file manager
  #
  # flake.modules.nixos.yazi = {pkgs, ...}: {};

  flake.modules.homeManager.yazi = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings.mgr.show_hidden = true;
      shellWrapperName = "yy";
    };
  };
}
