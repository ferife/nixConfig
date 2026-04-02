{inputs, ...}: {
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      system-minimal
      home-manager
      networkmanager
      vpn
      systemd-boot
      gnome
      regreet
      hyprland
    ];
  };
}
