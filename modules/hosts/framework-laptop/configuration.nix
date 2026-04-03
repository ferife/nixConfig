{inputs, ...}: {
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      system-minimal

      bluetooth
      gnome
      home-manager
      hyprland
      networkSettings
      regreet
      stylix
      systemd-boot
      vpn
    ];
  };
}
