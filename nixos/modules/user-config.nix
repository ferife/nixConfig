

{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fernandorf = {
    isNormalUser = true;
    description = "Fernando RiveraFernadez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };
}