{ config, lib, pkgs, system, inputs, ... }:
{
	options = {
		nixvimModule.enable = lib.mkEnableOption "My nixvim configuration, found at github:ferife/nvimConfig";
	};

	config = lib.mkIf config.nixvimModule.enable {
    home.packages = [ inputs.nixvim-config.packages.${system}.default ];
    home.shellAliases = {
      "update-nixvim" = "cd ~/Documents/Configs/nixConfig && nix flake update nixvim-config && cd -";
    };
	};
}
