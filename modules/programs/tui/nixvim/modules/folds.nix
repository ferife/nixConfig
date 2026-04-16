{inputs, ...}: {
  flake.modules.homeManager.nixvim-folds = {lib, ...}: {
    plugins = {
      nvim-ufo.enable = true;
      # origami.enable = true;

      statuscol = {
        enable = true;
        settings = {
          bt_ignore = null;
          clickhandlers = {
            FoldClose = "require('statuscol.builtin').foldclose_click";
            FoldOpen = "require('statuscol.builtin').foldopen_click";
            FoldOther = "require('statuscol.builtin').foldother_click";
            Lnum = "require('statuscol.builtin').lnum_click";
          };
          segments = [
            {
              text = ["%s"];
              click = "v:lua.ScSa";
            }
            {
              text = [{__raw = "require('statuscol.builtin').foldfunc";}];
              click = "v:lua.ScFa";
            }
            {
              click = "v:lua.ScLa";
              condition = [true {__raw = "require('statuscol.builtin').not_empty";}];
              text = [{__raw = "require('statuscol.builtin').lnumfunc";} " "];
            }
          ];
          clickmod = "c";
          ft_ignore = null;
          setopt = true;
          thousands = ".";
        };
      };
    };

    opts = {
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;

      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = "-";
        foldsep = " ";
      };
    };
  };
}
