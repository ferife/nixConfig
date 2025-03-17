{ config, lib, ... }: {
  options.hm.gnome.enable = lib.mkEnableOption "GNOME, the Desktop Environment";
}
