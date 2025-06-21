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

  # TODO: Experiment with Niri, a scrolling window manager

  config.hm.wm = {
    window-manager = "hyprland";

    max-volume = 120;
    app-launcher = "rofi";
  };
}
