

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gimp        # Image Editor
    libreoffice # Office Suite
    obs-studio  # Recording Software
    obsidian    # Note-taking Tool
  ];
  programs.obs-studio = {
    enable = true;
  };
}