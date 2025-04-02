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
  # TODO: Set up Keepassium app on phone
}
