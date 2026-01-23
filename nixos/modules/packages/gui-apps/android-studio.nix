{
  config,
  lib,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.nixos.android-studio {
    environment.systemPackages = with pkgs-unstable; [
      android-studio
    ];
    nixpkgs.config.android_sdk.accept_license = true;
    users.users.${config.nixos.specialArgs.user-settings.username}.extraGroups = ["kvm"];
  };
}
