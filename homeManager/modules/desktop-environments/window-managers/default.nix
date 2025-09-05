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
    window-manager = "hyprland";

    max-volume = 120;
    app-launcher = "rofi";
  };
  # Consider using wob for volume/brightness bar (it's supported by stylix)
}
