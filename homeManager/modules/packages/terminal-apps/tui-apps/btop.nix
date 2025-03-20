{
  config,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.btop) {programs.btop.enable = true;})
  ];
}
