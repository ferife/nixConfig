

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunderbird # Email client
  ];
}