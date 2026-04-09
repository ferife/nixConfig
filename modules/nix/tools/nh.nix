{inputs, ...}: {
  # nh is a helper that makes it easier to update my config

  flake.modules.nixos.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      flake = "/home/fernandorf/Documents/Configs/nixConfig/nixConfig-main";
    };
  };

  flake.modules.homeManager.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      flake = "/home/fernandorf/Documents/Configs/nixConfig/nixConfig-main";
    };
  };
}
