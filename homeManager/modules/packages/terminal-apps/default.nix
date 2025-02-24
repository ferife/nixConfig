{ config, lib, pkgs, ... }:
{
  imports = [
    ./command-tools
    ./terminal-emulators
    ./tui-apps
  ];
}
# TODO: Look into installing yazi file manager
