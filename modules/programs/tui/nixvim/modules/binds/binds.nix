{inputs, ...}: {
  flake.modules.homeManager.nixvim-binds = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      nixvim-binds-basic
    ];
  };
}
