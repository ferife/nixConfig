{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.gaming.enable {
    # hardware.opengl = {
    #   enable = true;
    #   driSupport = true;
    #   dirSupport32Bit = true;
    # };
    #
    # If GPU is NVIDIA
    # services.xserver.videoDrivers = ["nvidia"];
    # hardware.nvidia.modesetting.enable = true;
    #
    # If GPU is AMD
    # services.xserver.videoDrivers = ["amdgpu"];

    programs.gamemode.enable = true;
    # GameMode is a daemon that requests optimizations to be temporarily applied to the OS or game processes
  };
}
