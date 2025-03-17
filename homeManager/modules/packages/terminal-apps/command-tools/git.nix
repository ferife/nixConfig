{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.git {
    programs.git = {
      enable = true;
      userEmail = "ferife@icloud.com";
      userName = "Fernando RF";
    };
  };
}
