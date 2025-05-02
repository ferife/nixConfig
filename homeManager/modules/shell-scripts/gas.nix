{
  config,
  lib,
  pkgs,
  ...
}: let
  new-gas = pkgs.writeShellScriptBin "newGas" ''
    pathAlejandra=$(which alejandra 2> /dev/null) || pathAlejandra=${pkgs.alejandra}/bin/alejandra
    echo "$pathAlejandra"
    echo "Home Manager Script"
  '';
in {
  config = lib.mkIf config.hm.scripts.gas {
    home.packages = [
      new-gas
    ];
  };
}
