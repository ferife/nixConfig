{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fernandorf = {
    isNormalUser = true;
    description = "Fernando Rivera Fernandez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
}
