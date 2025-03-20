{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    firefoxNixosModule.enable = lib.mkEnableOption "Installs & configures Mullvad VPN";
  };

  config = lib.mkIf config.firefoxNixosModule.enable {
    # environment.systemPackages = with pkgs; [ (firefox.override { extraNativeMessagingHosts = [ passff-host ]; }) ];
    programs.firefox = {
      enable = true;
      nativeMessagingHosts.packages = with pkgs; [passff-host];
    };
  };
}
