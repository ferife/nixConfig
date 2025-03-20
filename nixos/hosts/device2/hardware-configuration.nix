{
  config,
  pkgs,
  ...
}: {
  # CHANGE ONCE THIS CONFIG STARTS TO BE USED IN A SECOND HOST

  imports = [
    ./../laptop/hardware-configuration.nix
  ];
}
