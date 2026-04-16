{inputs, ...}: {
  # OBS studio is a program used for recording the screen and managing video/audio input from multiple sources

  flake.modules.homeManager.obs-studio = {pkgs, ...}: {
    programs.obs-studio.enable = true;
  };
}
