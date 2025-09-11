{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./command-tools
    ./tui-apps
  ];
}
