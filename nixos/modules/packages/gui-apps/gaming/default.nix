{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./steam.nix
    ./openrazer.nix
    ./input-remapper.nix
  ];

  config.nixos.gaming = {
    steam = lib.mkDefault config.nixos.gaming.enable;
    openrazer = lib.mkDefault config.nixos.gaming.enable;
    inputRemapper = lib.mkDefault config.nixos.gaming.enable;
  };
}
# TODO: Set up gaming based on the Vimjoyer video about gaming on NixOS

