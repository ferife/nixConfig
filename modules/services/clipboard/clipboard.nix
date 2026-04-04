{inputs, ...}: {
  flake.modules.nixos.clipboard = {pkgs, ...}: {
    environment.systemPackages = [pkgs.wl-clipboard];
  };

  flake.modules.homeManager.clipboard = {pkgs, ...}: {
    services.clipse = {
      enable = true;
    };
  };
}
