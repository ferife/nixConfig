

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch  # Display system specifications
    neovim    # Edit code from the terminal
  ];
}