{ config, lib, ... }: {
  options.nixos.homeManager = lib.mkEnableOption "Home Manager";
}
