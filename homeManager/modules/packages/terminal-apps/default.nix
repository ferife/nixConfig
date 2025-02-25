{ config, lib, pkgs, ... }:
{
  imports = [
    ./command-tools
    ./terminal-emulators
    ./tui-apps
  ];
}
