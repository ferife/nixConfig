{inputs, ...}: {
  # wpaperd is a wayland wallpaper daemon

  # flake.modules.nixos.wpaperd = {pkgs, ...}: {};

  flake.modules.homeManager.wpaperd = {lib, ...}: {
    services.wpaperd = {
      enable = true;
      settings.default = {
        duration = "3m";
        mode = "center";
      };
    };
  };
}
