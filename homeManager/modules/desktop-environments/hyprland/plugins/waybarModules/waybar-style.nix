{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.waybar {
    stylix.targets.waybar = {
      enable = false;
      # enableLeftBackColors = true;
      # enableCenterBackColors = true;
      # enableRightBackColors = true;
    };

    programs.waybar.style = let
      # NOTE: Waybar uses a version of CSS named GTK CSS
      declarations = rec {
        colors = config.lib.stylix.colors.withHashtag;
        variables = builtins.concatStringsSep "\n" [
          "@define-color base00 ${colors.base00};"
          "@define-color base01 ${colors.base01};"
          "@define-color base02 ${colors.base02};"
          "@define-color base03 ${colors.base03};"
          "@define-color base04 ${colors.base04};"
          "@define-color base05 ${colors.base05};"
          "@define-color base06 ${colors.base06};"
          "@define-color base07 ${colors.base07};"
          "@define-color base08 ${colors.base08};"
          "@define-color base09 ${colors.base09};"
          "@define-color base0A ${colors.base0A};"
          "@define-color base0B ${colors.base0B};"
          "@define-color base0C ${colors.base0C};"
          "@define-color base0D ${colors.base0D};"
          "@define-color base0E ${colors.base0E};"
          "@define-color base0F ${colors.base0F};"
          "@define-color module-bg-color rgba(0, 0, 0, 0.2);"
        ];
        final = "${variables}";
      };
    in
      # lib.mkBefore "${declarations.final}\n\n${builtins.readFile ./waybar.css}";
      lib.mkBefore "${declarations.final}\n\n${builtins.readFile ./waybar.css}";
  };
}
