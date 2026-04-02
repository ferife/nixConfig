{inputs, ...}: {
  # flake.modules.nixos.noctalia = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia = {lib, ...}: {
    programs.noctalia-shell.settings.general = {
      lockScreenAnimations = true;
      clockFormat = "HH:mm:ss | ddd, MMM dd";
    };
  };
}
