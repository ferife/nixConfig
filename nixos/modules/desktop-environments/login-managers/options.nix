{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixos.login-manager = {
    name = lib.mkOption {
      type = lib.types.enum ["gdm"];
      description = "The login manager to use";
    };
  };
}
