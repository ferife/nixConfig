{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.eclipse {
    programs.eclipse = {
      enable = true;
    };
  };
}
