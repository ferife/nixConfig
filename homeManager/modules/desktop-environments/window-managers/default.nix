{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./components
    ./hyprland
  ];

  # NOTE: wearewaylandnow.com is a website listing many tools and packages that can be used for all sorts of things in wayland systems

  config.hm.wm = {
    hyprland.enable = lib.mkIf (config.hm.wm.window-manager == "hyprland") true;

    max-volume = 120;
    app-launcher = "rofi";
  };
}
