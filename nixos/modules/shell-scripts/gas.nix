{
  config,
  lib,
  pkgs,
  ...
}: let
  new-gas = pkgs.writeShellScriptBin "newGas" ''
    pathAlejandra=$(which alejandra 2> /dev/null) || pathAlejandra=${pkgs.alejandra}/bin/alejandra
    echo "$pathAlejandra"
    echo "NixOS Script"
  '';
in {
  config = lib.mkIf config.nixos.scripts.gas {
    environment.systemPackages = [
      new-gas
    ];
  };
}
