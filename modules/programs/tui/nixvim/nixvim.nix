{inputs, ...}: {
  # flake.modules.nixos.nixvim = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim = {pkgs, ...}: {
    imports = [inputs.nixvim.homeModules.nixvim];

    programs.lazygit.settings.os.editPreset = "nvim";
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimdiffAlias = true;
      imports = [inputs.self.modules.homeManager.nixvimModules];
    };
  };
}
