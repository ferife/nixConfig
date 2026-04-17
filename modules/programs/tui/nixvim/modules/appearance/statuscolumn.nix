{inputs, ...}: {
  flake.modules.homeManager.nixvim-statuscolumn = {lib, ...}: {
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

    plugins = {
      snacks = {
        enable = true;
        settings.statuscolumn = {
          enable = true;
          folds = {
            git_hl = true;
            open = true;
          };
        };
      };

      statuscol = lib.mkMerge [
        # {enable = true;}
        {
          settings = {
            bt_ignore = null;
            clickhandlers = {
              FoldClose = "require('statuscol.builtin').foldclose_click";
              FoldOpen = "require('statuscol.builtin').foldopen_click";
              FoldOther = "require('statuscol.builtin').foldother_click";
              Lnum = "require('statuscol.builtin').lnum_click";
            };
            segments = [
              # Sign column
              {
                text = ["%s"];
                click = "v:lua.ScSa";
              }

              # Fold column
              {
                text = [{__raw = "require('statuscol.builtin').foldfunc";}];
                click = "v:lua.ScFa";
              }

              # Line number column
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
        }
      ];
    };
  };
}
