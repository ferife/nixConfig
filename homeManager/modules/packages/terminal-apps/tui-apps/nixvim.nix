{
  config,
  lib,
  system,
  inputs,
  ...
}:
{
	options = {
		nixvim.enable = lib.mkEnableOption "My nixvim configuration, found at github:ferife/nvimConfig";
	};

	config = lib.mkIf config.nixvim.enable {
    home.packages = [ inputs.nixvim-config.packages.${system}.default ];
    home.shellAliases = {
      "nixvim" = "nvim";
      "update-nixvim" = "
        cd ~/Documents/Configs/nixConfig &&
        nix flake update nixvim-config &&
        cd -";
    };
    stylix.targets.neovim.enable = false;
    stylix.targets.nixvim.enable = false;
    stylix.targets.vim.enable    = false;
	};
}
# TODO: Make it so that every time I open nixvim, it shows the name of the latest active commit
# This is so that I know whether I need to update the flake input to achieve what I want
