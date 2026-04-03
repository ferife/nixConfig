{inputs, ...}: {
  flake.modules.nixos.bluetooth = {pkgs, ...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.Policy.AutoEnable = false;
    };

    # To open blueman from the CLI, run `blueman-manager`
    services.blueman.enable = true;
  };

  # flake.modules.homeManager.bluetooth = {pkgs, ...}: {};
}
