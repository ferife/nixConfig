{
  config,
  lib,
  ...
}: {
  imports = [
    ./options.nix

    ./cursor.nix
    ./stylix.nix
    ./wpaperd.nix
  ];

  hm = {
    stylix = {
      enable = lib.mkDefault true;
      theme = config.hm.specialArgs.user-settings.colorscheme;
    };
    wpaperd = lib.mkDefault true;
  };

  fonts.fontconfig.enable = true;
}
