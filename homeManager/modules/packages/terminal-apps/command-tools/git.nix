{ config, lib, pkgs, ... }:

{
  options = {
    gitModule.enable = lib.mkEnableOption "Installs & configures Git, the most widely used version control system";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.git = {
      enable = true;
      userEmail = "ferife@icloud.com";
      userName = "Fernando RF";
    };
  };
}
