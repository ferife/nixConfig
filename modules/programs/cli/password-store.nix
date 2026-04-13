{inputs, ...}: {
  # password-store is a CLI password manager
  #
  # WARN: password-store's repo gets new commits merged to main incredibly infrequently
  # "Infrequently" being less than once a year
  # It also uses shitty deprecated encryption methods (see https://youtu.be/j-qBChKG15Y)
  # For these reasons, I've created this file without adding any flake modules to it, so I have this written down somewhere I'll find it if I forget this and come across password-store in the future
  #
  # flake.modules.nixos.password-store = {pkgs, ...}: {};

  # flake.modules.homeManager.password-store = {pkgs, ...}: {};
}
