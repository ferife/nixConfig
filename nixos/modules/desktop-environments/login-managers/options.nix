{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixos.login-manager = {
    name = lib.mkOption {
      type = lib.types.enum ["gdm" "regreet"];
      description = "The login manager to use";
    };
  };
}
