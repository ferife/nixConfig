{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-binds-basic = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-binds-basic = {pkgs, ...}: {
    keymaps = [
      {
        action = "<c-\\><c-n>";
        key = "<esc><esc>";
        mode = "t";
        options.desc = "Easily escape terminal mode";
      }
    ];
  };
}
