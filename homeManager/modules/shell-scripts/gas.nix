{
  config,
  lib,
  pkgs,
  ...
}: let
  new-gas-script = ''
    pathAlejandra=$(which alejandra 2> /dev/null) || pathAlejandra=${pkgs.alejandra}/bin/alejandra
    echo "$pathAlejandra"
    echo "Home Manager Script"
  '';
  new-gas-bin = pkgs.writeShellScriptBin "newGas" new-gas-script;
in {
  config = lib.mkIf config.hm.scripts.gas {
    home.packages = [
      new-gas-bin
    ];
  };
}
