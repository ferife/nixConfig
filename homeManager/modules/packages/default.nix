{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./gui-apps
    ./terminal-apps
  ];
  # TODO: Add a WhatsApp client
  # TODO: Try out pkgs.mouseless or some equivalent
}
