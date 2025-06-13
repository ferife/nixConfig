{
  config,
  lib,
  ...
}: {
  imports = [
    ./options.nix

    ./cursor.nix
    ./stylix.nix
  ];

  hm.stylix = {
    enable = lib.mkDefault true;
    theme = config.hm.specialArgs.user-settings.colorscheme;
  };
}
