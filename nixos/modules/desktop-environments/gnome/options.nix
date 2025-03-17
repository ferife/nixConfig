{ config, lib, ... }: {
  options.nixos.gnome = {
    enable = lib.mkEnableOption "some basic NixOS config for GNOME that needed to happen outside of Home Manager";
    gdmSettings = lib.mkEnableOption "GDM Settings, a settings menu for customizing the login screen";
  };
}
