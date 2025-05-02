{
  config,
  lib,
  pkgs,
  ...
}: let
  new-gas-script = lib.concatStringsSep "\n" [
    ''
      pathAlejandra=$(which alejandra 2> /dev/null) || pathAlejandra=${pkgs.alejandra}/bin/alejandra
      echo "$pathAlejandra"
      echo "Home Manager Script"
    ''
    (lib.strings.optionalString
      # lib.mkIf
      config.hm.scripts.test
      "echo newcondConcat")
  ];
  new-gas-bin = pkgs.writeShellScriptBin "newGas" new-gas-script;
in {
  config = lib.mkIf config.hm.scripts.gas {
    home.packages = [
      new-gas-bin
    ];
  };
}
