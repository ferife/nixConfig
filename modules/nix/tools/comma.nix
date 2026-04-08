{inputs, ...}: {
  # Adds the ability to easily run software without explicitly installing it
  #
  # Example using cowsay: , cowsay "hello"
  # This example will run cowsay, even if it's not installed

  flake.modules.nixos.comma = {pkgs, ...}: {
    imports = [inputs.self.modules.nixos.nix-index-database];

    programs.nix-index-database.comma.enable = true;
  };

  flake.modules.homeManager.comma = {pkgs, ...}: {
    imports = [inputs.self.modules.homeManager.nix-index-database];

    programs.nix-index-database.comma.enable = true;
  };
}
