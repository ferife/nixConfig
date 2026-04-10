{inputs, ...}: {
  # playerctl is a CLI tool used to control playing audio/video tracks
  #
  # flake.modules.nixos.playerctl = {pkgs, ...}: {};

  flake.modules.homeManager.playerctl = {pkgs, ...}: {
    services.playerctld.enable = true;
  };
}
