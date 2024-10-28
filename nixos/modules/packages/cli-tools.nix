

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    
  ];

  programs.neovim = {
    # Terminal code editor
    enable = true;
  };
}