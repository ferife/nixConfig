{
  description = "A flake for my NixOS configuration";
  # Shown in the CLI by the `nix flake metadata` command

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11"; # Stable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; # Unstable

    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      # url = "github:nix-community/home-manager?ref=release-25.11"; # Stable
      url = "github:nix-community/home-manager"; # Unstable
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix.url = "github:danth/stylix/release-25.11"; # Stable
    stylix.url = "github:danth/stylix"; # Unstable

    nixvim-config = {
      url = "github:ferife/nvimConfig";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # NOTE: To update a single input, use the command `nix flake update <name-of-input>`

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-unstable,
    home-manager,
    stylix,
    nixos-hardware,
    ...
  } @ inputs: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
      };
    };
    pkgs-stable = import nixpkgs-stable {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
      };
    };
  in {
    # NixOS Configuration Entrypoint
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          system = "x86_64-linux";
          inherit pkgs;
          inherit pkgs-stable;
          inherit pkgs-unstable;
        };
        modules = [
          (./. + "/nixos/hosts/laptop/configuration.nix")
          stylix.nixosModules.stylix
          nixos-hardware.nixosModules.framework-amd-ai-300-series
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    homeConfigurations = {
      "fernandorf@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          system = "x86_64-linux";
          inherit inputs;
          inherit pkgs;
          inherit pkgs-stable;
          inherit pkgs-unstable;
        };
        modules = [
          (./. + "/homeManager/hosts/laptop/home.nix")
          ./homeManager/hosts/laptop/home.nix
          stylix.homeModules.stylix
        ];
      };
    };
  };
}
# To install packages from both stable and unstable
# environment.systemPackages =
#   (with pkgs; [
#     STABLE PACKAGES
#   ])
#   ++
#   (with pkgs-unstable; [
#     UNSTABLE PACKAGES
#   ]);

