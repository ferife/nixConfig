{
  config,
  lib,
  pkgs,
  ...
}: let
  new-gas = pkgs.writeShellScriptBin "newGas" ''
    echo "Gas Script"
  '';
in {
  config = lib.mkIf config.nixos.scripts.gas {
    environment.systemPackages = with pkgs; [
      new-gas
    ];
  };
}
