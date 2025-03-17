{ config, lib, ... }: {
  options.nixos = {
    bash = lib.mkEnableOption "bash at a system-wide level";
    zsh  = lib.mkEnableOption "zsh at a system-wide level";
  };
}
