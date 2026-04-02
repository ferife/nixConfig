{inputs, ...}: {
  # flake.modules.nixos.cursor = {pkgs, ...}: {};

  flake.modules.homeManager.cursor = {pkgs, ...}: {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      # hyprcursor.enable = true;
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
    };
  };
}
