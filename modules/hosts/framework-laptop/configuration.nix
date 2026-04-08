{inputs, ...}: {
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "laptop";

  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [system-desktop];
  };
}
