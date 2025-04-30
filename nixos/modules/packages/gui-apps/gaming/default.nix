{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./gaming-options.nix

    ./input-remapper.nix
    ./mangohud.nix
    ./openrazer.nix
    ./proton-ge.nix
    ./steam.nix
  ];

  config.nixos.gaming = {
    inputRemapper = lib.mkDefault config.nixos.gaming.enable;
    mangohud = lib.mkDefault config.nixos.gaming.enable;
    openrazer = lib.mkDefault config.nixos.gaming.enable;
    protonGe = lib.mkDefault config.nixos.gaming.enable;
    steam = lib.mkDefault config.nixos.gaming.enable;
  };
  # TODO: Set up gaming based on the Vimjoyer video about gaming on NixOS
  # NOTE: For each game on Steam, go to the game's settings in the steam app, in the "General" section, and add the following lines to the launch options
  # gamemoderun %command%
  # mangohud %command%
  # gamescope %command%
  # TODO: Look into installing Lutris
}
