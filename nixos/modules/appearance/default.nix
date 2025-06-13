{
  config,
  lib,
  ...
}: {
  imports = [
    ./options.nix

    ./stylix.nix
  ];

  nixos.stylix = {
    enable = lib.mkDefault true;
    theme = config.nixos.specialArgs.user-settings.colorscheme;
  };
}
