{inputs, ...}: {
  # neofetch is a system information tool
  #
  # flake.modules.nixos.neofetch = {pkgs, ...}: {};

  flake.modules.homeManager.neofetch = {pkgs, ...}: {
    home.packages = [pkgs.neofetch];
    programs = {
      bash.initExtra = "neofetch";
      zsh.initContent = "neofetch";
    };
  };
}
