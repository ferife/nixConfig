{inputs, ...}: {
  flake.modules.homeManager.noctalia = {lib, ...}: {
    programs.noctalia-shell.settings.notifications.sounds.enabled = true;
  };
}
