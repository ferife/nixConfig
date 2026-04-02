{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.zoxide {
    programs.zoxide = lib.mkMerge [
      {enable = true;}

      (lib.mkIf config.hm.bash {
        enableBashIntegration = true;
      })

      (lib.mkIf config.hm.zsh {
        enableZshIntegration = true;
      })
    ];
    programs.fzf.enable = true;
  };
}
