{inputs, ...}: {
  # flake.modules.nixos.hyprland = {pkgs, ...}: {};

  flake.modules.homeManager.hyprland = {
    lib,
    pkgs,
    ...
  }: {
    wayland.windowManager.hyprland.settings = {
      bindd = [
        "SUPER, return, Open a terminal window, exec, ${lib.getExe pkgs.ghostty}"
        "SUPER SHIFT, return, Open a browser window, exec, ${lib.getExe pkgs.librewolf}"
        "SUPER, Space, Open the app launcher, exec, ${lib.getExe pkgs.rofi} -show drun"
        "SUPER, O, Open obsidian.md, exec, ${lib.getExe pkgs.obsidian}"
        "SUPER, P, Open the password manager, exec, ${lib.getExe pkgs.keepassxc}"
      ];
    };
  };
}
