

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libgcc  # Compiler for C & C++
  ];
}