{inputs, ...}: {
  # This adds a database of all programs in nixpkgs unstable to make it easy to search for files within it
  # The database gets updated weekly
  # Adds the nix-locate command, which can search through nixpkgs for specific filenames

  flake-file.inputs.nix-index-database = {
    url = "github:nix-community/nix-index-database";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.nix-index-database = {pkgs, ...}: {
    imports = [inputs.nix-index-database.nixosModules.default];
  };

  flake.modules.homeManager.nix-index-database = {pkgs, ...}: {
    imports = [inputs.nix-index-database.homeModules.default];
  };
}
