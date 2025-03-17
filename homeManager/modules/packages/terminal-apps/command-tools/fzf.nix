{ config, lib, pkgs, ... }:
{
  # To search through command history in the terminal using fzf, simply use CTRL+R

	config = lib.mkIf config.hm.fzf {
		programs.fzf = {
      enable = true;
    };
	};
}
