{inputs, ...}: {
  flake.modules.nixos.sddm = {pkgs, ...}: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  # flake.modules.homeManager.sddm = {pkgs, ...}: {};
}
