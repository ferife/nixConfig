{inputs, ...}: {
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      system-minimal

      bluetooth
      gnome
      home-manager
      hyprland
      networkmanager
      regreet
      systemd-boot
      vpn
    ];
  };
}
