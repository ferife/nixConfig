{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.bc {
    home.packages = with pkgs; [
      bc
    ];
  };
}
