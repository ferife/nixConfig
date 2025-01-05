{ config, lib, pkgs, ... }:

{
  options = {
    passModule.enable = lib.mkEnableOption "Installs & configures password-store, a password storing solution";
  };

  config = lib.mkIf config.passModule.enable {
    programs.password-store = {
      enable = true;
    };
    home.packages = with pkgs; [ 
      passff-host # Required for the firefox extension to work
      python313   # Required for the firefox extension to work
    ];
  };
}
