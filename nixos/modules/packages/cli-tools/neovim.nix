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

	programs.java = {
		enable = true;
		package = pkgs.jdk8;
  };
}