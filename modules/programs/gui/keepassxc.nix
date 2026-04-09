{inputs, ...}: {
  # KeePassXC is an encrypted password manager
  #
  # flake.modules.nixos.keepassxc = {pkgs, ...}: {};

  flake.modules.homeManager.keepassxc = {pkgs, ...}: {
    programs.keepassxc = {
      enable = true;
    };
  };
}
