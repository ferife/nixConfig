{inputs, ...}: {
  # A clipboard manager is used to manage stuff that is to be copied/cut and pasted

  flake.modules.nixos.clipboard = {pkgs, ...}: {
    environment.systemPackages = [pkgs.wl-clipboard];
  };

  flake.modules.homeManager.clipboard = {pkgs, ...}: {
    services.clipse = {
      enable = true;
    };
  };
}
