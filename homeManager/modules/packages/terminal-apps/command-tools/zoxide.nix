{ config, lib, pkgs, ... }:
{
	options = {
		zoxide.enable = lib.mkEnableOption "Installs & configures zoxide, the replacement for the cd command";
	};

	config = lib.mkIf config.zoxide.enable {
		programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
    programs.fzf.enable = true;
	};
}

# NOTE: After installing zoxide, run "zoxide init <shell>", where <shell> is the shell you're using (bash, zsh, fish, etc.)
# This is necessary to get zoxide to work
