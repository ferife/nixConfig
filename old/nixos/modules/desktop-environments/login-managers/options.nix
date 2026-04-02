{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixos.login-manager = {
    name = lib.mkOption {
      type = lib.types.enum ["gdm" "regreet" "sddm"];
      description = "The login manager to use";
    };
  };
}
