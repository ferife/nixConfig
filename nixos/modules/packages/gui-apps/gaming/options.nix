{
  config,
  lib,
  ...
}: {
  options.nixos.gaming = {
    inputRemapper = lib.mkEnableOption "input-remapper, a tool used to change the mapping of input device buttons";
    mangohud = lib.mkEnableOption "MangoHud, a tool that displays FPS, temperatures, and other similar statistics while gaming";
    openrazer = lib.mkEnableOption "an OpenRazer GUI app for configuring their peripherals";
    protonGe = lib.mkEnableOption "Proton GE, a fork of Proton which adds some extra patches and may improve performance";
    steam = lib.mkEnableOption "Steam, the game store, installer, and launcher created by Valve";
  };
}
