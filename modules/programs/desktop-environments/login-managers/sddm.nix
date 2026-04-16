{inputs, ...}: {
  # SDDM is a login manager

  flake.modules.nixos.sddm = {pkgs, ...}: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
