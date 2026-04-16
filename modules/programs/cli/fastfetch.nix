{inputs, ...}: {
  # fastfetch is a system information tool

  flake.modules.homeManager.fastfetch = {pkgs, ...}: {
    programs = {
      fastfetch.enable = true;

      bash.initExtra = "fastfetch";
      zsh.initContent = "fastfetch";
    };
  };
}
