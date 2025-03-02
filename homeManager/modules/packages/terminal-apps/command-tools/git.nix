{ config, lib, pkgs, ... }:
{
  options = {
    git.hm.enable = lib.mkEnableOption "Installs & configures Git, the most widely used version control system";
  };

  config = lib.mkIf config.git.hm.enable {
    programs.git = {
      enable = true;
      userEmail = "ferife@icloud.com";
      userName = "Fernando RF";
    };
  };
}
