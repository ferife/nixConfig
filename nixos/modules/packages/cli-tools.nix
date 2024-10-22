

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch  # Display system specifications
  ];

  programs.neovim = {
    # Terminal code editor
    enable = true;
  };
}