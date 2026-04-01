{inputs, ...}: {
  flake.modules.nixos.vpn = {pkgs, ...}: {
    imports = [inputs.self.modules.nixos.mullvad];
  };

  flake.modules.homeManager.vpn = {pkgs, ...}: {
    imports = [inputs.self.modules.homeManager.mullvad];
  };
}
