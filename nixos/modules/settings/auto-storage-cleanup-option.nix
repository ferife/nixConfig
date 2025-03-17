{ lib, config, pkgs, ... }:
{
  config = lib.mkIf config.nixos.autoStorageCleanupOption {

    # Limit the number of generations to keep
    boot.loader.systemd-boot.configurationLimit = 10;
    # boot.loader.grub.configurationLimit = 10;

    # Perform garbage collection daily to maintain low disk usage
    nix.gc = {
      automatic = true;
      dates = "daily";
      # options = "--delete-older-than 1w";
    };

    # Optimize storage
    # You can also manually optimize the store via:
    #    nix-store --optimise
    # Refer to the following link for more details:
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    nix.settings.auto-optimise-store = true;
  };
}
