{ config, lib, pkgs, ... }:
{
  imports = [
    ./steam.nix
    ./openrazer.nix
    ./input-remapper.nix
  ];

  options = {
		gaming.enable = lib.mkEnableOption "Installs & configures gaming-related stuff";
	};

  config.gaming = {
    steam.enable = lib.mkDefault config.gaming.enable;
    openrazer.enable = lib.mkDefault config.gaming.enable;
    inputRemapper.enable  = lib.mkDefault config.gaming.enable;
  };
}
# TODO: Set up gaming based on the Vimjoyer video about gaming on NixOS
