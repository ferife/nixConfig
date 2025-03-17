{ config, lib, ... }: {
  options.nixos.gaming = {
    steam = lib.mkEnableOption "Steam, the game store, installer, and launcher created by Valve";
    openrazer = lib.mkEnableOption "an OpenRazer GUI app for configuring their peripherals";
    inputRemapper = lib.mkEnableOption "input-remapper, a tool used to change the mapping of input device buttons";
  };
}
