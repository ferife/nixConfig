{
  config,
  pkgs,
  ...
}: {
  # TODO: CHANGE ONCE THIS CONFIG STARTS TO BE USED IN A SECOND HOST

  imports = [
    ./../laptop/configuration.nix
  ];
}
