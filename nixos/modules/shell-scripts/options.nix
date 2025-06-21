{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixos.scripts = lib.mkOption {
    description = "A set of scripts that can be referenced within other modules";
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        enable = lib.mkEnableOption "this script module";
        source = lib.mkOption {
          type = lib.types.oneOf [lib.types.path lib.types.lines];
          description = "The path to the source file, or the source code";
        };
        path = lib.mkOption {
          type = lib.types.str;
          description = "The path of the final resulting file, NOT including the \"$HOME/\" or \"/env/\"";
        };
        true-path = lib.mkOption {
          type = lib.types.str;
          description = "The path of the final resulting file, including the \"$HOME\" or \"/etc/\"";
        };
      };
    });
  };
}
