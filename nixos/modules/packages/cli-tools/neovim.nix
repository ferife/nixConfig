# This module includes neovim dependencies
# Do not deactivate this module unless the home manager module for neovim is also disabled

{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		libgcc
		gcc
		python313
		nodejs_22
		wget
	];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [ fira-code-nerdfont ];
  };

	programs.java.enable = true;
}
