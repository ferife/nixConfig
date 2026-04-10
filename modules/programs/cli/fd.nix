{inputs, ...}: {
  # fd is a tool used for finding files in a filesystem and running commands on them
  #
  # flake.modules.nixos.fd = {pkgs, ...}: {};

  flake.modules.homeManager.fd = {pkgs, ...}: {
    programs.fd = {
      enable = true;
      hidden = true;
      ignores = [".git/" "*.bak"];
    };

    home.shellAliases.find = "fd";
  };
}
