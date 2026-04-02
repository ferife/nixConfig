{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.bash {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
    home.shellAliases = {
      "fc" = "fc -e nvim"; # sets default editor for fc to nvim
    };
  };
}
