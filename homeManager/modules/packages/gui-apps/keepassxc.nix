{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.keepassxc {
    home.packages = with pkgs; [
      keepassxc
    ];
  };
}
