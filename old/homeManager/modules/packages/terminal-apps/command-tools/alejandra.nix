{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.alejandra {
    home.packages = with pkgs; [alejandra];
  };
}
