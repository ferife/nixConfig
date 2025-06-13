{
  config,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${config.nixos.specialArgs.user-settings.username} = {
    isNormalUser = true;
    description = "${config.nixos.specialArgs.user-settings.name}";
    extraGroups = ["networkmanager" "wheel"];
    # packages = with pkgs; [];
  };
}
