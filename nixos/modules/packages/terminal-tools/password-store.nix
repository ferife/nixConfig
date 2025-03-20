{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    passNixosModule.enable = lib.mkEnableOption "Configures some dependencies necessary to get password-store to work (in home manager)";
  };

  config = lib.mkIf config.passNixosModule.enable {
    services.pcscd.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
    environment.systemPackages = with pkgs; [
      passff-host
    ];
  };
}
