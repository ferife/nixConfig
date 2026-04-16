{inputs, ...}: {
  # wpaperd is a wayland wallpaper daemon

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
