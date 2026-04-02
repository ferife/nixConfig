{inputs, ...}: {
  # flake.modules.nixos.noctalia = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia = {lib, ...}: {
    programs.noctalia-shell.settings.audio = {
      volumeOverdrive = true;
      volumeFeedback = true;
    };
  };
}
