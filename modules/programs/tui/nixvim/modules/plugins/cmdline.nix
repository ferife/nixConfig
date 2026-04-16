{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-cmdline = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-cmdline = {pkgs, ...}: {
    plugins.mini-cmdline = {
      enable = true;

      settings = {
        autocomplete.enable = true;
        autocorrect.enable = true;
        autopeek.enable = true;
      };
    };
  };
}
