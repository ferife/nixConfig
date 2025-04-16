{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.pandoc {
    programs.texlive = {
      # texlive packages are a pandoc dependency
      enable = true;
      packageSet = pkgs.texlive.combined.scheme-small;
    };
    programs.pandoc = {
      enable = true;
    };
  };
  # FIXME: Figure out how to use texlive to install pdflatex, a dependency of pandoc
  # pdflatex is not available by itself in nixpkgs, which is why I need to figure out how to use texlive for this instead
}
