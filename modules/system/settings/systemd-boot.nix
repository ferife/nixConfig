{inputs, ...}: {
  flake.modules.nixos.systemd-boot = {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # flake.modules.homeManager.systemd-boot = {};
}
