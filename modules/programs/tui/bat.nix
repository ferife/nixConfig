{inputs, ...}: {
  # bat is a tool to print the contents of text files to the terminal

  flake.modules.homeManager.bat = {pkgs, ...}: {
    programs.bat.enable = true;
    home.shellAliases.cat = "bat";
  };
}
