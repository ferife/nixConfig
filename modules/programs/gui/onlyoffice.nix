{inputs, ...}: {
  # OnlyOffice is an office suite

  flake.modules.homeManager.onlyoffice = {pkgs, ...}: {
    programs.onlyoffice.enable = true;
  };
}
