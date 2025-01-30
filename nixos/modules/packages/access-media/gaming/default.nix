

{ config, lib, pkgs, ... }:
{
  options = {
		gaming.enable = lib.mkEnableOption "Installs & configures gaming-related stuff";
	};

  imports = [
    ./steam.nix
    ./openrazer.nix
    ./input-remapper.nix
  ];

  config = lib.mkIf config.gaming.enable {
    steamModule.enable = lib.mkDefault true;
    openrazerModule.enable = lib.mkDefault true;
    inputRemapperModule.enable  = lib.mkDefault true;
  };
}