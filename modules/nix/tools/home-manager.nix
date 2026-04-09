{inputs, ...}: {
  # Home manager is a tool for reproducible management of the contents of users' home directories

  flake-file.inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  imports = [inputs.home-manager.flakeModules.home-manager];

  flake.modules.nixos.home-manager = {
    imports = let
      home-manager-config = {lib, ...}: {
        home-manager = {
          verbose = true;
          useUserPackages = true;
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          backupCommand = "rm";
          overwriteBackup = true;
        };
      };
    in [
      inputs.home-manager.nixosModules.home-manager
      home-manager-config
    ];
  };
}
