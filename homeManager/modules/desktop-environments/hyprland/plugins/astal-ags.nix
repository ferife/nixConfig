{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  config = lib.mkIf config.hm.hyprland.astal {
    programs.ags = {
      enable = true;
      configDir = null;
      extraPackages = with pkgs; [
        inputs.ags.packages.${pkgs.system}.battery
        fzf
      ];
    };
    home.packages = with inputs.ags.packages.${pkgs.system}; [
      io
      notifd
    ];
  };
}
