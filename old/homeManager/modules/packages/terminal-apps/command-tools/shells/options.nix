{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    bash = mkEnableOption "Bash, the GNU Bourne-Again Shell";
    zsh = mkEnableOption "Z shell, an extended version of bash with new features and support for plugins and themes";
  };
}
